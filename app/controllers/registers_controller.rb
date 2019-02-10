class RegistersController < ApplicationController
  respond_to :json

  def create
    account = Account.new(register_params)
    if account.create
      render jsonapi: account.user
    else
      render jsonapi_errors: account.errors, :status => :bad_request
    end
  end
  private

  private
    def register_params
      params
        .require(:data)
        .require(:attributes)
        .permit(:first_name, :last_name, :email, :password, :organization_name)
    end
end
