require 'test_helper'

class RegistersControllerTest < ActionDispatch::IntegrationTest
  test "can create an account" do
    post "/registers",
      params: {
        data: {
          attributes: {
            full_name: "jhon doe",
            email: "jhon@test.com",
            organization_name: "FS",
            password: "ThisisA$$Pass2"
          }
        }
      }
    assert_response :success
  end
end
