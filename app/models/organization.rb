class Organization < ApplicationRecord
  has_many :users, through: :organization_users
end
