json.array!(@forum_messages) do |forum_message|
  json.extract! forum_message, :id, :forum_thread_id, :content, :user_id
  json.url forum_message_url(forum_message, format: :json)
end
