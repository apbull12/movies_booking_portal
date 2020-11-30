json.extract! movie, :id, :name, :category, :description, :status, :created_at, :updated_at
json.url movie_url(movie, format: :json)
