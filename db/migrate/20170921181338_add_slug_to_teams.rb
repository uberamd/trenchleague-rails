class AddSlugToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :slug, :string, unique: true
  end
end
