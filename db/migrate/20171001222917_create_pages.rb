class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :shortname
      t.text :contents
      t.integer :user_id

      t.timestamps
    end
  end
end
