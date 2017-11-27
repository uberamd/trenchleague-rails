class AddRankTierCeilingToAdminSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :league_settings, :rank_tier_ceiling, :integer
  end
end
