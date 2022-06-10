json.extract! dependent, :id, :insured_id, :name, :date_of_birth, :relationship, :created_at, :updated_at
json.url dependent_url(dependent, format: :json)
