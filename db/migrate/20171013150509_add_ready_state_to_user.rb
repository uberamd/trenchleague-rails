class AddReadyStateToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :lobby_ready_state, :boolean, default: false
  end
end
