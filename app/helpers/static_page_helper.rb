module StaticPageHelper
  def league_averages
    mmr_hash = {
        :solo => 0,
        :party => 0,
        :solo_players => 0,
        :party_players => 0,
    }

    User.where.not(:opendota_solo_mmr => nil, :opendota_party_mmr => nil).all.each do |user|
      mmr_hash[:solo] += user.opendota_solo_mmr
      mmr_hash[:solo_players] += 1

      mmr_hash[:party] += user.opendota_party_mmr
      mmr_hash[:party_players] += 1
    end

    mmr_hash[:solo] = (mmr_hash[:solo] / mmr_hash[:solo_players]).round unless mmr_hash[:solo_players] == 0
    mmr_hash[:party] = (mmr_hash[:party] / mmr_hash[:party_players]).round unless mmr_hash[:party_players] == 0

    return mmr_hash
  end
end
