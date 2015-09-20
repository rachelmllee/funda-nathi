class AddReferenceToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :reference, :string
  end
end
