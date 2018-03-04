json.extract! recipe_share, :id, :recipe_id, :user_id, :created_at, :updated_at
json.url recipe_share_url(recipe_share, format: :json)
