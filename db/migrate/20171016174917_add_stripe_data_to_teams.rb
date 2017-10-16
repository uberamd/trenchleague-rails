class AddStripeDataToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :paid_stripe_token, :string
    add_column :teams, :paid_stripe_token_type, :string
    add_column :teams, :paid_stripe_email, :string
  end
end
