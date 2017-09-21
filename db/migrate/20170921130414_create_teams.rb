class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.boolean :is_active, default: true
      t.boolean :is_banned, default: false
      t.boolean :is_deleted, default: false
      t.string :name

      t.timestamps
    end
  end
end
