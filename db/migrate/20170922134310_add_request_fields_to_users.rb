class AddRequestFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :team_join_approved, :boolean, default: false
    add_column :users, :team_join_date, :datetime
    add_column :users, :team_join_approved_by, :integer
  end
end
