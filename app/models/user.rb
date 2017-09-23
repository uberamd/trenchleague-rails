class User < ApplicationRecord
  belongs_to :team, optional: true

  def get_short_steamid
    return self.steamid.to_i - 76561197960265728
  end
end
