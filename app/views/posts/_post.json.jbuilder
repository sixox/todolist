json.extract! post, :id, :title, :content, :kind, :category, :tag, :created_at, :updated_at
json.url post_url(post, format: :json)
json.content post.content.to_s