json.extract! publication, :id, :name, :description, :picture, :price, :created_at, :updated_at
json.url publication_url(publication, format: :json)
