class CreateInhouseMatchPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :inhouse_match_players do |t|
      t.integer :inhouse_match_id
      t.integer :user_id
      t.integer :starting_elo
      t.integer :elo_change

      t.timestamps
    end
  end
end
