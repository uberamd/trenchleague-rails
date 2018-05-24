class OpendotaHeroRefreshJob < ApplicationJob
  require 'json'

  queue_as :default

  def perform(user)
    # get the data from the opendota API
    response = HTTParty.get("https://api.opendota.com/api/players/#{user.get_short_steamid}/heroes")

    if response.code != 200
      # something went wrong
      Raven.capture_message("Error running job, non 200", {
          :tags => {'job' => 'opendota_hero_refresh'}})
    else

      # parse the response JSON
      api_hash = JSON.parse(response.body)

      api_hash.each do |hero|
        # find the real hero id from the db by referencing the opendota provided ID
        real_hero = Hero.find_by(odota_hero_id: hero['hero_id'].to_i)

        # create or find an entry for that user and the corresponding hero
        tmp_user_hero = UserHeroes.find_or_create_by(user_id: user.id, hero_id: real_hero.id)

        # finally update the wins and losses
        tmp_user_hero.update_attributes({
                                            last_played: hero['last_played'],
                                            games: hero['games'],
                                            win: hero['win'],
                                            with_games: hero['with_games'],
                                            with_win: hero['with_win'],
                                            against_games: hero['against_games'],
                                            against_win: hero['against_win']
                                        })
      end
    end

  end
end
