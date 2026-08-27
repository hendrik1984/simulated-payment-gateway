require "test_helper"

class Api::V1::PaymentMethodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_payment_methods_index_url
    assert_response :success
  end
end
