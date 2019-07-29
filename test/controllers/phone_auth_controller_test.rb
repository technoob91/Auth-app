require 'test_helper'

class PhoneAuthControllerTest < ActionDispatch::IntegrationTest
  test "should get send_otp" do
    get phone_auth_send_otp_url
    assert_response :success
  end

  test "should get verify_otp" do
    get phone_auth_verify_otp_url
    assert_response :success
  end

end
