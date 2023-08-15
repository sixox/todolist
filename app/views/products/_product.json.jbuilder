json.extract! product, :id, :name, :description, :content, :created_at, :updated_at
json.url product_url(product, format: :json)
json.content product.content.to_s
