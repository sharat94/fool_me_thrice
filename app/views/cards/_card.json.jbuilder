json.extract! card, :id, :user_id, :description, :topic_id, :upvotes, :downvotes, :source, :created_at, :updated_at
json.url card_url(card, format: :json)
