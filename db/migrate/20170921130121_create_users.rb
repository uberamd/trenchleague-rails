class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :steamid
      t.string :avatar
      t.boolean :is_active, default: true
      t.boolean :is_deleted, default: false
      t.boolean :is_banned, default: false
      t.datetime :lastseen
      t.string :personaname
      t.string :loccountrycode

      t.timestamps
    end
  end
end
