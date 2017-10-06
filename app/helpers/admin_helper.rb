module AdminHelper
  def calculate_elo(participants)

    averages = { :won => 0, :lost => 0, :won_players => 0, :lost_players => 0 }

    EloRating::k_factor = 40
    match = EloRating::Match.new

    participants.each do |participant|
      if participant[:won]
        averages[:won] += participant[:elo]
        averages[:won_players] += 1
      else
        averages[:lost] += participant[:elo]
        averages[:lost_players] += 1
      end
    end

    # average out the winning and losing team elo
    averages[:won]  = (averages[:won] / averages[:won_players]).round
    averages[:lost] = (averages[:lost] / averages[:lost_players]).round

    match.add_player(rating: averages[:won], winner: true)
    match.add_player(rating: averages[:lost])

    participants.each do |participant|
      if participant[:won]
        participant[:updated_elo] = participant[:elo] + (match.updated_ratings[0] - averages[:won])
        participant[:elo_change] = match.updated_ratings[0] - averages[:won]
      else
        participant[:updated_elo] = participant[:elo] - (averages[:lost] - match.updated_ratings[1])
        participant[:elo_change] = match.updated_ratings[1] - averages[:lost]
      end
    end

    return participants
  end

  def xeditable? object = nil
    true # Or something like current_user.xeditable?
  end
end
