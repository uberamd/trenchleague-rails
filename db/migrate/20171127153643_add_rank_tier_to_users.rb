class AddRankTierToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rank_tier, :integer, default: nil
  end
end
