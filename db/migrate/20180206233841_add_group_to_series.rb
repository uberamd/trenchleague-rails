class AddGroupToSeries < ActiveRecord::Migration[5.1]
  def change
    add_reference :series, :group, foreign_key: true
  end
end
