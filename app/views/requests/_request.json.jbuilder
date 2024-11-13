json.extract! request, :id, :title, :description, :contact, :picture, :created_at, :updated_at
json.url request_url(request, format: :json)
