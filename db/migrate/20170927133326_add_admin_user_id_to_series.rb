class AddAdminUserIdToSeries < ActiveRecord::Migration[5.1]
  def change
    add_column :series, :admin_user_id, :integer
  end
end
