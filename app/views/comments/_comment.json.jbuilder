json.extract! comment, :id, :user_id,  :body, :created_at, :updated_at
json.url article_url(comment, format: :json)
