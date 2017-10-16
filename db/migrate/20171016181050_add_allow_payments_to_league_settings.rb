class AddAllowPaymentsToLeagueSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :league_settings, :allow_payments, :boolean, default: false
  end
end
