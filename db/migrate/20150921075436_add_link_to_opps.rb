class AddLinkToOpps < ActiveRecord::Migration
  def change
    add_column :opps, :Link, :string
  end
end
