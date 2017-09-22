class AddProfileurlToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profileurl, :string
  end
end
