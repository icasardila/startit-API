class OrganizationUser < ApplicationRecord
  has_many :users
  has_many :organizations
end
