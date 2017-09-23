class AddMmrToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :opendota_solo_mmr, :integer
    add_column :users, :opendota_party_mmr, :integer
    add_column :users, :opendota_estimated_mmr, :integer
    add_column :users, :opendota_mmr_updated, :datetime
  end
end
