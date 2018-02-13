class ChangeSeriesMatchesSetMatchId < ActiveRecord::Migration[5.1]
  def change
    change_column :series_matches, :match_id, :bigint
  end
end
