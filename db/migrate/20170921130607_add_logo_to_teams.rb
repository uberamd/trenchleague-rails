class AddLogoToTeams < ActiveRecord::Migration[5.1]
  def change
    add_attachment :teams, :logo
  end
end
