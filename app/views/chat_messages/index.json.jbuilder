json.array!(@chat_messages) do |chat_message|
  json.extract! chat_message, :id, :creator_id, :body, :chat_id, :is_read
  json.url chat_message_url(chat_message, format: :json)
end
