class AddPaymentdetailsToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :credit, :integer
    add_column :accounts, :name, :string
    add_column :accounts, :email, :string
    add_column :accounts, :session_stamp, :timestamp
  end
end
