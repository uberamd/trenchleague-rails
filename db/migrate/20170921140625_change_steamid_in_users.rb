class ChangeSteamidInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :steamid, :string
  end
end
