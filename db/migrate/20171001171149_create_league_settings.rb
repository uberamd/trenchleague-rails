class CreateLeagueSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :league_settings do |t|
      t.integer :team_cost_usd
      t.integer :party_mmr_ceiling
      t.integer :solo_mmr_ceiling
      t.integer :max_teams
      t.integer :max_players
      t.integer :max_players_per_team
      t.boolean :allow_team_creation, default: true
      t.boolean :allow_player_registration, default: true

      t.timestamps
    end
  end
end
