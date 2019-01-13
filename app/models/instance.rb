class Instance < ApplicationRecord
  belongs_to :responsable, class_name: :users
end
