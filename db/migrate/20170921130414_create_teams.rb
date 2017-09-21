class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.boolean :is_active
      t.boolean :is_banned
      t.boolean :is_deleted
      t.string :name

      t.timestamps
    end
  end
end
