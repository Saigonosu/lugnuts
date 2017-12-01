json.extract! review, :id, :user, :product, :review, :stars, :created_at, :updated_at
json.url review_url(review, format: :json)
