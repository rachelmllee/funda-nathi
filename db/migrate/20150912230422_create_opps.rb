class CreateOpps < ActiveRecord::Migration
  def change
    create_table :opps do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
