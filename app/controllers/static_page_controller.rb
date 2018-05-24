class StaticPageController < ApplicationController
  include StaticPageHelper
  include RankTierHelper

  def index
    @tier_hash = league_averages
    get_rank_tier_player_distribution
  end

  def rules
    @rules = Page.where(:shortname => 'rules').all.first

    if @rules.nil?
      @rules = Page.new
    end
  end

  def changelog
    # nothing here
  end

  def bracket

  end

  def staff
    @staff = Page.where(:shortname => 'staff').all.first

    if @staff.nil?
      @staff = Page.new
    end
  end

  def distributions
    @rank_hash = get_rank_tier_player_distribution
  end

  def faq
    @faqs = Faq.where(is_visible: true, is_deleted: false).all
  end

  def faq_create
    authorize! :isplayer, current_user

    @faq = Faq.create({
                          question: new_faq_params,
                          asked_by_user_id: current_user.id
                      })
    @faq.save!

    flash[:success] = 'New FAQ question successfully submitted'
    redirect_to faq_path
  end

  private

  def new_faq_params
    params.require(:question)
  end
end
