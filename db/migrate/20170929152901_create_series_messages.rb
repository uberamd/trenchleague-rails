class CreateSeriesMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :series_messages do |t|
      t.integer :series_id
      t.integer :user_id
      t.text :message
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
