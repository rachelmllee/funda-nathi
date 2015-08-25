json.array!(@webinars) do |webinar|
  json.extract! webinar, :id, :user_id, :chat_id
  json.url webinar_url(webinar, format: :json)
end
