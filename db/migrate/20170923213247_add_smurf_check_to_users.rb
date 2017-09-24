class AddSmurfCheckToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :smurf_check, :integer, default: 0
  end
end
