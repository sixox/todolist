json.extract! contact, :id, :full_name, :phone, :message, :status, :created_at, :updated_at
json.url contact_url(contact, format: :json)
