class CreateUserHeroes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_heroes do |t|
      t.references :user, foreign_key: true
      t.references :hero, foreign_key: true
      t.datetime :last_played
      t.integer :games
      t.integer :win
      t.integer :with_games
      t.integer :with_win
      t.integer :against_games
      t.integer :against_win

      t.timestamps
    end
  end
end
