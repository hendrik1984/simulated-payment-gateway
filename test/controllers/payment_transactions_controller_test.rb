require "test_helper"

class PaymentTransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payment_transactions_index_url
    assert_response :success
  end
end
