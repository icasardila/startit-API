class Account
  include ActiveModel::Validations
  include ActiveModel::AttributeAssignment

  attr_accessor :first_name, :last_name, :email, :organization_name, :password, :user
  validates_presence_of :first_name, :last_name, :password, :organization_name

  def initialize(args)
    assign_attributes(args)
  end

  def create
    return false if !valid?
    begin
      User.transaction do
        organization = Organization.create!(name: organization_name)
        self.user = User.create!(
          first_name: first_name,
          last_name: last_name,
          email: email,
          password: password,
        )
        OrganizationUser.create!(
          organization: organization,
          user: user,
          is_owner: true,
        )
      end
    rescue => e
      record_errors = e.record.errors
      if e.record.is_a? Organization
        record_errors.to_h.each do |field, error|
          if field == 'base'
            errors.add(:base, error)
          else
            errors.add(:organization_name, error)
          end
        end
      else
        errors.merge!(record_errors)
      end
      return false
    end
  end
end
