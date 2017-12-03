module RankTierHelper

  # this will hold the 5 rank medal tiers, and the icon for each medal
  # the normalized_base converts the values from being 2 digits [1-7][0-5] to 1-42,
  # makes it easier to do maths
  RankMedals = {
      '1' => { 'name' => 'Herald',   'icon' => '', 'normalized_base' => 1,  'normalized_ceiling' => 6  },
      '2' => { 'name' => 'Guardian', 'icon' => '', 'normalized_base' => 7,  'normalized_ceiling' => 12 },
      '3' => { 'name' => 'Crusader', 'icon' => '', 'normalized_base' => 13, 'normalized_ceiling' => 18 },
      '4' => { 'name' => 'Archon',   'icon' => '', 'normalized_base' => 19, 'normalized_ceiling' => 24 },
      '5' => { 'name' => 'Legend',   'icon' => '', 'normalized_base' => 25, 'normalized_ceiling' => 30 },
      '6' => { 'name' => 'Ancient',  'icon' => '', 'normalized_base' => 31, 'normalized_ceiling' => 36 },
      '7' => { 'name' => 'Divine',   'icon' => '', 'normalized_base' => 37, 'normalized_ceiling' => 43 }
  }

  def get_rank_tier_player_distribution
    medals = RankMedals

    full_hash = {}
    medals.each do |k,v|
      for i in v['normalized_base']..v['normalized_ceiling']
        full_hash[i] = {}
        full_hash[i]['name'] = "#{v['name']} #{i - v['normalized_base']}"
        full_hash[i]['count'] = 0
      end
    end

    User.where.not(rank_tier: nil).all.each do |user|
      normalized_tier = convert_proper_tier_to_normalized_rank(user.rank_tier)
      full_hash[normalized_tier]['count'] += 1
    end

    return full_hash
  end

  # this will take in a rank_tier (int) and return back a slightly more verbose hash of data
  def get_rank_tier_hash(rank_tier)

    # this needs to be casted as a string since we're substr'in off of it
    medal = rank_tier.to_s[0]
    stars = rank_tier.to_s[1]

    # return back a hash that has medal info and how many stars should be represented
    return {
        'medal' => RankMedals["#{medal}"],
        'stars' => stars
                    }
  end

  # returns all rank medals. Same data available via RankTierHelper::RankMedals
  def get_all_rank_medals
    return RankMedals
  end

  def convert_proper_tier_to_normalized_rank(proper)
    medal = proper.to_s[0]
    stars = proper.to_s[1]

    base = RankMedals["#{medal}"]['normalized_base']

    return base + stars.to_i
  end

  def convert_normalized_rank_to_proper_tier(normalized)
    tmp_rank = nil

    RankMedals.each do |k,v|
      if normalized >= v['normalized_base'] && normalized <= v['normalized_ceiling']
        tmp_rank = "#{k}#{normalized - v['normalized_base']}"
      end
    end

    return tmp_rank
  end

end