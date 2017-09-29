class SeriesController < ApplicationController

  include SeriesHelper

  add_breadcrumb :index, :series_path

  def show
    @series = Series.find(params[:id])
    @team_series = TeamSeries.where(:team_id => current_user.team_id, :series_id => @series.id).first
    @opponent_series = TeamSeries.where(:series_id => @series.id).where.not(:team_id => current_user.team_id).first

    @new_series_message = SeriesMessage.new

    add_breadcrumb "#{@series.teams[0].name} vs. #{@series.teams[1].name}"
  end

  def update
    @series = Series.find(params[:id])

    authorize! :scheduleseries, @series

    case params[:seriesaction]
      when 'propose'
        # this is what is triggered when you propose a time

        if @series.scheduled_date.nil?
          # no date is scheduled, lets propose a time

          # check for empty date
          if params[:scheduled_date] == ''
            flash[:danger] = 'Invalid date submitted, please try again.'
            redirect_to show_series_path(@series) and return
          end

          # check for invalid date
          begin
            DateTime.parse(params[:scheduled_date])
          rescue
            flash[:danger] = 'Invalid date submitted, please try again.'
            redirect_to show_series_path(@series) and return
          end

          @series.scheduled_date = params[:scheduled_date]
          @team_series = TeamSeries.where(:team_id => current_user.team_id, :series_id => @series.id).first

          @team_series.team_approved_user_id = current_user.id
          @team_series.team_approved_date = Time.now()
          @series.save!
          @team_series.save!

          flash[:success] = 'You have successfully proposed a time for this series.'
          redirect_to show_series_path(@series) and return
        end
      when 'selfreject'
        # this is what is triggered when you remove your own proposal

        @team_series = TeamSeries.where(:team_id => current_user.team_id, :series_id => @series.id).first
        @opponent_series = TeamSeries.where(:series_id => @series.id).where.not(:team_id => current_user.team_id).first

        if @series.scheduled_date.nil?
          # can't selfreject a series with no proposal
          flash[:danger] = 'Unable to remove your proposed time as no time has been suggested for this series.'
          redirect_to show_series_path(@series) and return
        end

        if !@opponent_series.team_approved_date.nil?
          # the opponent has already accepted this time slot
          flash[:danger] = 'Unable to remove your proposed time as your opponent has already accepted this proposal.'
          redirect_to show_series_path(@series) and return
        end

        # remove the proposed time
        @series.scheduled_date = nil
        @series.save!

        @team_series.team_approved_date = nil
        @team_series.team_approved_user_id = nil
        @team_series.save!

        flash[:success] = 'You have successfully removed your time proposal. Remember to reschedule.'
        redirect_to show_series_path(@series) and return

      when 'proposereject'
        # this is what is triggered when you reject your opponents proposal
        @team_series = TeamSeries.where(:team_id => current_user.team_id, :series_id => @series.id).first
        @opponent_series = TeamSeries.where(:series_id => @series.id).where.not(:team_id => current_user.team_id).first

        if @series.scheduled_date.nil?
          # can't proposereject a series with no proposal
          flash[:danger] = 'Unable to reject the proposed time as no time has been suggested for this series.'
          redirect_to show_series_path(@series) and return
        end

        if @opponent_series.team_approved_date.nil?
          # the opponent has already removed their proposal this time slot
          # in theory we never get here with the above if statement
          flash[:danger] = 'Unable to reject the proposed time, your opponent may have already removed their proposal.'
          redirect_to show_series_path(@series) and return
        end

        if @series.completed
          flash[:danger] = 'This series has already been marked as completed.'
          redirect_to show_series_path(@series) and return
        end

        # do the rejection
        @series.scheduled_date = nil
        @series.save!

        # since the opponents proposed time has been rejected, remove their proposal
        @opponent_series.team_approved_date = nil
        @opponent_series.team_approved_user_id = nil
        @opponent_series.save!

        # for good measure, blank users teams proposals as well
        @team_series.team_approved_date = nil
        @team_series.team_approved_user_id = nil
        @team_series.save!

        flash[:success] = 'You have successfully rejected the proposed time. Remember to reschedule.'
        redirect_to show_series_path(@series) and return

      when 'acceptseries'
        # when the other team is good with your proposed time (impossible right??)
        @team_series = TeamSeries.where(:team_id => current_user.team_id, :series_id => @series.id).first
        @opponent_series = TeamSeries.where(:series_id => @series.id).where.not(:team_id => current_user.team_id).first

        # do regular checking for sanity because people are asshats
        if @series.scheduled_date.nil?
          # someone tried to accept a match with no proposed time
          flash[:danger] = 'Unable to accept the proposed time as no time has been proposed.'
          redirect_to show_series_path(@series) and return
        end

        if @series.completed
          flash[:danger] = 'This series has already been marked as completed.'
          redirect_to show_series_path(@series) and return
        end

        if @opponent_series.team_approved_date.nil?
          # someone is trying to accept a series when the opponent hasn't accepted yet
          flash[:danger] = 'Your opponent must accept this proposed time.'
          redirect_to show_series_path(@series) and return
        end

        # finally accept the match
        @team_series.team_approved_user_id = current_user.id
        @team_series.team_approved_date = Time.now()
        @team_series.save!

        flash[:success] = 'You have successfully accepted the series start time proposal.'
        redirect_to show_series_path(@series) and return

      when 'assignadmin'
        # this allows a league admin to attach themselves to a series
        authorize! :leagueadmin, @series

        @series.admin_user_id = current_user.id
        @series.save!

        flash[:success] = 'You have successfully been assigned as admin for this series.'
        redirect_to show_series_path(@series) and return
    end
  end

  def caster_update
    @series = Series.find(params[:id])

    case params[:seriesaction]
      when 'assigncaster'
        authorize! :cast, @series

        @series.caster = current_user
        @series.save!

        flash[:success] = 'Successfully assigned as the series caster.'
        redirect_to show_series_path(@series) and return
    end

    flash[:danger] = 'What exactly are you trying to do?'
    redirect_to show_series_path(@series) and return
  end

  def post_message
    @series = Series.find(params[:id])

    authorize! :scheduleseries, @series

    @message = SeriesMessage.new

    @message.user_id = current_user.id
    @message.series_id = @series.id
    @message.message = params[:message]

    notify_uids = []
    if @message.save
      # check to see if each captain should receive this notification
      @series.teams.each do |team|
        tmp_user = team.users.where(:team_captain => true).first

        if tmp_user.id != current_user.id
          # this user didn't send the message, create notification
          notify_uids << tmp_user.id
        end
      end

      notify_uids.each do |uid|
        Notification.create({
            user_id: uid,
            resource_type: 'seriesmessage',
            resource_id: @message.id
                            })
      end
    end

    flash[:success] = 'Message successfully posted.'
    redirect_to show_series_path(@series, :anchor => "message-#{@message.id}") and return
  end

  def index
  end
end
