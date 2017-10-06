class CreateInhouseMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :inhouse_matches do |t|
      t.integer :match_id
      t.integer :recorded_user_id

      t.timestamps
    end
  end
end
