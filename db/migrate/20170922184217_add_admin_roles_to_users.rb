class AddAdminRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_global_admin, :boolean, default: false
    add_column :users, :is_league_admin, :boolean, default: false
    add_column :users, :is_league_caster, :boolean, default: false
    add_column :users, :is_match_admin, :boolean, default: false
  end
end
