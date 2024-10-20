json.extract! review, :id, :potatoes, :comments, :created_at, :updated_at
json.url review_url(review, format: :json)
