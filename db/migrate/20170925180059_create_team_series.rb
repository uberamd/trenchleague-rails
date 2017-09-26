class CreateTeamSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :team_series do |t|
      t.integer :team_id
      t.integer :series_id
      t.integer :team_approved_user_id
      t.datetime :team_approved_date

      t.timestamps
    end
  end
end
