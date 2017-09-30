class CreateSeriesMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :series_matches do |t|
      t.references :series, index: true
      t.integer :match_id
      t.integer :winning_team_id
      t.integer :losing_team_id
      t.string :vod_url

      t.timestamps
    end

    add_foreign_key :series_matches, :series
  end
end
