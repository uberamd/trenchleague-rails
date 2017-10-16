class AddPaymentDescriptionToLeagueSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :league_settings, :payment_description, :text
  end
end
