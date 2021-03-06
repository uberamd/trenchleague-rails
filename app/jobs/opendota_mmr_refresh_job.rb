class OpendotaMmrRefreshJob < ApplicationJob
  require 'json'

  queue_as :default

  def perform(user)
    # set some raven contexts
    Raven.user_context(id: user.id)

    # get the data from the opendota API
    response = HTTParty.get("https://api.opendota.com/api/players/#{user.get_short_steamid}/")

    # parse the response JSON
    api_hash = JSON.parse(response.body)

    # add the hash to raven
    Raven.extra_context(api_hash: api_hash)

    # if solo MMR exists, update it
    if api_hash['solo_competitive_rank'] != nil
      user.opendota_solo_mmr = api_hash['solo_competitive_rank']
    end

    # if party MMR exists, update it
    if api_hash['competitive_rank'] != nil
      user.opendota_party_mmr = api_hash['competitive_rank']
    end

    # if estimated MMR exists, update it
    if api_hash['mmr_estimate']['estimate'] != nil
      user.opendota_estimated_mmr = api_hash['mmr_estimate']['estimate']
    end

    # if rank_tier exists, update it
    if api_hash['rank_tier'] != nil
      user.rank_tier = api_hash['rank_tier']
    end

    user.opendota_mmr_updated = Time.now()

    # at least for now, update other fields as well
    if api_hash['profile']
      user.personaname = api_hash['profile']['personaname']
      user.profileurl = api_hash['profile']['profileurl']
      user.avatar = api_hash['profile']['avatarmedium']
      user.loccountrycode = api_hash['profile']['loccountrycode']
    end

    user.save!
  end
end
