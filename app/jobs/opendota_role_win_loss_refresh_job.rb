class OpendotaRoleWinLossRefreshJob < ApplicationJob
  require 'json'

  queue_as :default

  def perform(user)
    # get the data from the opendota API
    stock = HTTParty.get("https://api.opendota.com/api/players/#{user.get_short_steamid}/wl")
    unknown_0 = HTTParty.get("https://api.opendota.com/api/players/#{user.get_short_steamid}/wl?lane_role=0")
    safe_1 = HTTParty.get("https://api.opendota.com/api/players/#{user.get_short_steamid}/wl?lane_role=1")
    mid_2 = HTTParty.get("https://api.opendota.com/api/players/#{user.get_short_steamid}/wl?lane_role=2")
    off_3 = HTTParty.get("https://api.opendota.com/api/players/#{user.get_short_steamid}/wl?lane_role=3")
    jungle_4 = HTTParty.get("https://api.opendota.com/api/players/#{user.get_short_steamid}/wl?lane_role=4")

    # parse the response JSON
    stock_hash = JSON.parse(stock.body)
    unknown_hash = JSON.parse(unknown_0.body)
    safe_hash = JSON.parse(safe_1.body)
    mid_hash = JSON.parse(mid_2.body)
    off_hash = JSON.parse(off_3.body)
    jungle_hash = JSON.parse(jungle_4.body)

    stock_obj = user.odota_win_loss_records.find_or_create_by(lane_role: nil)
    stock_obj.update_attributes({
        win: stock_hash['win'].to_i,
        lose: stock_hash['lose'].to_i
                                })

    unknown_obj = user.odota_win_loss_records.find_or_create_by(lane_role: 0)
    unknown_obj.update_attributes({
                                    win: unknown_hash['win'].to_i,
                                    lose: unknown_hash['lose'].to_i,
                                    lane_role: 0
                                })

    safe_obj = user.odota_win_loss_records.find_or_create_by(lane_role: 1)
    safe_obj.update_attributes({
                                      win: safe_hash['win'].to_i,
                                      lose: safe_hash['lose'].to_i,
                                      lane_role: 1
                                  })
    mid_obj = user.odota_win_loss_records.find_or_create_by(lane_role: 2)
    mid_obj.update_attributes({
                                      win: mid_hash['win'].to_i,
                                      lose: mid_hash['lose'].to_i,
                                      lane_role: 2
                                  })
    off_obj = user.odota_win_loss_records.find_or_create_by(lane_role: 3)
    off_obj.update_attributes({
                                      win: off_hash['win'].to_i,
                                      lose: off_hash['lose'].to_i,
                                      lane_role: 3
                                  })
    jungle_obj = user.odota_win_loss_records.find_or_create_by(lane_role: 4)
    jungle_obj.update_attributes({
                                      win: jungle_hash['win'].to_i,
                                      lose: jungle_hash['lose'].to_i,
                                      lane_role: 4
                                  })
  end
end
