module FormSchema
  class BaseInput
    include ActiveModel::Validations
    attr_accessors :id, :title, :description, :required

    validates_presence_of :title, :id, :required
  end
end
