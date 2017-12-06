class CreateHeroes < ActiveRecord::Migration[5.1]
  def change
    create_table :heroes do |t|
      t.string :name
      t.string :localized_name
      t.string :primary_attr
      t.string :attack_type
      t.string :roles
      t.integer :odota_hero_id
      t.integer :legs
      t.string :image

      t.timestamps
    end
  end
end
