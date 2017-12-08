class CreateOdotaWinLossRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :odota_win_loss_records do |t|
      t.references :user, foreign_key: true
      t.integer :lane_role
      t.integer :win
      t.integer :lose

      t.timestamps
    end
  end
end
