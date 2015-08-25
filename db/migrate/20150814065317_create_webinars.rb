class CreateWebinars < ActiveRecord::Migration
  def change
    create_table :webinars do |t|
      t.references :user, index: true, foreign_key: true
      t.references :chat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
