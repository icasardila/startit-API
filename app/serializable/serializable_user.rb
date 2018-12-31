class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attribute :email
  attribute :created_at
  attribute :updated_at
end
