json.extract! subject, :id, :topic_id, :name, :created_at, :updated_at
json.url subject_url(subject, format: :json)
