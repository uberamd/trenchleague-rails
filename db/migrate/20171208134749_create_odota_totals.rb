class CreateOdotaTotals < ActiveRecord::Migration[5.1]
  def change
    create_table :odota_totals do |t|
      t.references :user, foreign_key: true
      t.string :field
      t.integer :total
      t.integer :sample_size

      t.timestamps
    end
  end
end
