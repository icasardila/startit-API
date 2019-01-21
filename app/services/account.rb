class Account
  include ActiveModel::Validations
  include ActiveModel::AttributeAssignment

  attr_accessor :full_name, :email, :organization_name, :password, :user
  validates_presence_of :full_name, :email, :password, :organization_name

  def initialize(args)
    assign_attributes(args)
  end

  def create
    return false if !valid?
    begin
      User.transaction do
        organization = Organization.create!(name: organization_name)
        self.user = User.create!(full_name: full_name, email: email, role: Role.owner)
        OrganizationUser.create!(
          organization: organization,
          user: user,
          is_owner: true,
        )
      end
    rescue => e
      errors.add(:base, e.to_s)
      return false
    end
  end
end
