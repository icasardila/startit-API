require 'test_helper'

class RegistersControllerTest < ActionDispatch::IntegrationTest
  test "can create an account" do
    post "/registers",
      params: {
        data: {
          attributes: {
            first_name: "doe",
            last_name: "doe",
            email: "jhon@test.com",
            organization_name: "FS",
            password: "ThisisA$$Pass2"
          }
        }
      }
    assert_response :success
  end

  test "response with error when invalid" do
    post "/registers",
      params: {
        data: {
          attributes: {
            first_name: "doe",
            last_name: "doe",
            email: "@test.com",
            organization_name: "FS",
            password: "ThisisA$$Pass2"
          }
        }
      }
    assert_response :bad_request
  end
end
