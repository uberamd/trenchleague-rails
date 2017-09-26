class AddInHouseEloToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :in_house_elo, :integer
  end
end
