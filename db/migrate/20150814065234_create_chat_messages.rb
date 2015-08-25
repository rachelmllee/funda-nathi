class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
      t.integer :creator_id
      t.string :body
      t.references :chat, index: true, foreign_key: true
      t.boolean :is_read

      t.timestamps null: false
    end
  end
end
