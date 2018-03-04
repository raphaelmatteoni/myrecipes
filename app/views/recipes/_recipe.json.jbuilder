json.extract! recipe, :id, :title, :description, :how_to_prepare, :user_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
