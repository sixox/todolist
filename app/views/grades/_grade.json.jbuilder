json.extract! grade, :id, :name, :description, :specification, :content, :product_id, :created_at, :updated_at
json.url grade_url(grade, format: :json)
json.specification grade.specification.to_s
json.content grade.content.to_s
