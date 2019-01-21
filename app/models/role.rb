class Role < ApplicationRecord
  has_many :users

  def self.owner
    Role.find_by(title: "owner")
  end
end
