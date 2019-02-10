class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :organizations, through: :organization_users

  devise :database_authenticatable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  def jwt_payload
    {
      email: email
    }
  end
end
