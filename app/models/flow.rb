class Flow < ApplicationRecord
  belongs_to :created_by, class_name: :users
  belongs_to :default_responsable,  class_name: :users
end
