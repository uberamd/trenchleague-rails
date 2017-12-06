class AddEmailInhousePositionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string
    add_column :users, :inhouse, :boolean, default: false
    add_column :users, :position, :string
    add_column :users, :free_agent, :boolean, default: false
  end
end
