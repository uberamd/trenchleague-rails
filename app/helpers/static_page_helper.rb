module StaticPageHelper
  include RankTierHelper

  def league_averages
    rank_hash = {
        :players => 0,
        :rank_tier => { :medal => '', :stars => 0 },
        :rank_tier_rolling => 0
    }

    User.where.not(:rank_tier => nil).all.each do |user|
      rank_hash[:rank_tier_rolling] += convert_proper_tier_to_normalized_rank(user.rank_tier)
      rank_hash[:players] += 1
    end

    tmp_rank_tier = 0

    if rank_hash[:players] > 0
      tmp_rank_tier = (rank_hash[:rank_tier_rolling] / rank_hash[:players]).round
    end

    # now that we have the normalized rank we need to convert it into something useful
    proper_tier = convert_normalized_rank_to_proper_tier(tmp_rank_tier)
    tier_hash = get_rank_tier_hash(proper_tier)

    #logger.debug("tmp_rank_tier: #{tmp_rank_tier}, proper_tier: #{proper_tier}, rank_tier_rolling: #{tier_hash[:rank_tier_rolling]}, players: #{tier_hash[:players]}, tier_hash: #{tier_hash}")

    return tier_hash
  end
end
