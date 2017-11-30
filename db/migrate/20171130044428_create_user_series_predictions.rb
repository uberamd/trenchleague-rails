class CreateUserSeriesPredictions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_series_predictions do |t|
      t.integer :user_id
      t.integer :series_id
      t.integer :team_id
      t.boolean :is_correct, default: nil

      t.timestamps
    end
  end
end
