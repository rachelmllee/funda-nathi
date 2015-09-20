class AddPaymentStatusToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :Payment_status, :string
  end
end
