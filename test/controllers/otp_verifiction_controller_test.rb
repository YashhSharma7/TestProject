require "test_helper"

class OtpVerifictionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get otp_verifiction_new_url
    assert_response :success
  end

  test "should get create" do
    get otp_verifiction_create_url
    assert_response :success
  end
end
