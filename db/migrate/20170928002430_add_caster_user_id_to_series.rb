class AddCasterUserIdToSeries < ActiveRecord::Migration[5.1]
  def change
    add_column :series, :caster_user_id, :integer
  end
end
