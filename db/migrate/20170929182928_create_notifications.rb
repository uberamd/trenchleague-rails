class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :user, index: true
      t.string :resource_type
      t.integer :resource_id
      t.boolean :is_read, default: false
      t.datetime :seen_on

      t.timestamps
    end

    add_foreign_key :notifications, :users
  end
end
