class SerializableFlow < JSONAPI::Serializable::Resource
  type 'flows'

  attribute :title
  attribute :description
  attribute :created_at
  attribute :updated_at
end
