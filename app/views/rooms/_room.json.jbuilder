json.extract! room, :id, :image, :name, :address, :price, :intro, :created_at, :updated_at
json.url room_url(room, format: :json)
