class OpendotaAllHeroesRefreshJob < ApplicationJob
  require 'json'

  queue_as :default

  def perform
    # get the data from the opendota API
    response = HTTParty.get('https://api.opendota.com/api/heroes')

    # parse the response JSON
    api_hash = JSON.parse(response.body)

    # iterate over all of the returned heroes
    api_hash.each do |hero|

      # create or update records
      Hero.find_or_create_by(name: hero['name']) do |upd_hero|
        upd_hero.localized_name = hero['localized_name']
        upd_hero.primary_attr = hero['primary_attr']
        upd_hero.attack_type = hero['attack_type']
        upd_hero.roles = hero['roles'].join(',')
        upd_hero.legs = hero['legs']
        upd_hero.image = hero['name'].gsub(/npc_dota_hero_/, '')
        upd_hero.odota_hero_id = hero['id'].to_i
      end
    end

    # once this task is done refresh the hero mappings
    RefreshAllHeroesJob.perform_later
  end
end
