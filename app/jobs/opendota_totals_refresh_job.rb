class OpendotaTotalsRefreshJob < ApplicationJob
  require 'json'

  queue_as :default

  def perform(user)
    # get the data from the opendota API
    response = HTTParty.get("https://api.opendota.com/api/players/#{user.get_short_steamid}/totals")

    # parse the response JSON
    api_hash = JSON.parse(response.body)

    api_hash.each do |total|
      # create or find an entry for that user and the corresponding hero
      tmp_total = user.odota_totals.find_or_create_by(field: total['field'])

      # finally update the wins and losses
      tmp_total.update_attributes({
                                          total: total['sum'],
                                          sample_size: total['n']
                                      })
    end
  end
end
