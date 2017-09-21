class AddTeamCaptainToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :team_captain, :boolean, default: false
  end
end
