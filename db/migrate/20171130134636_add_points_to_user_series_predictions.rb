class AddPointsToUserSeriesPredictions < ActiveRecord::Migration[5.1]
  def change
    add_column :user_series_predictions, :points, :integer
  end
end
