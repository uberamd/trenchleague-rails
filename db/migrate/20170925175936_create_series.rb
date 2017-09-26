class CreateSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :series do |t|
      t.datetime :scheduled_date
      t.datetime :target_begin_date
      t.datetime :target_end_date
      t.boolean :completed, default: false
      t.datetime :recorded_on

      t.timestamps
    end
  end
end
