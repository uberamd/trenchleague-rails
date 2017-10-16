class AddPaymentInformationToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :is_paid, :boolean, default: false
    add_column :teams, :paid_amount, :string
    add_column :teams, :paid_by, :integer
    add_column :teams, :paid_on, :datetime
  end
end
