class AddInhouseWinsLossesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :in_house_wins, :integer, default: 0
    add_column :users, :in_house_losses, :integer, default: 0
  end
end
