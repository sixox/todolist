json.extract! packing, :id, :name, :description, :content, :product_id, :created_at, :updated_at
json.url packing_url(packing, format: :json)
json.content packing.content.to_s
