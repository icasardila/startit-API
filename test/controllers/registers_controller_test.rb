require 'test_helper'

class RegistersControllerTest < ActionDispatch::IntegrationTest
  test "can create an account and return authorization" do
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
    assert_response :successs
    refute_nil response.headers['Authorization']
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
