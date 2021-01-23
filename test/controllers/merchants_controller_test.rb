require "test_helper"

class MerchantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @merchant = merchants(:one)
  end

  test "should get index" do
    get api_v1_merchants_url, as: :json
    assert_response :success
  end

  test "should create merchant" do
    assert_difference('Merchant.count') do
      post api_v1_merchants_url, params: { merchant: { name: @merchant.name } }, as: :json
    end

    assert_response 201
  end

  test "should show merchant" do
    get api_v1_merchant_url(@merchant), as: :json
    assert_response :success
  end

  test "should update merchant" do
    patch api_v1_merchant_url(@merchant), params: { merchant: { name: @merchant.name } }, as: :json
    assert_response 200
  end

  test "should destroy merchant" do
    assert_difference('Merchant.count', -1) do
      delete api_v1_merchant_url(@merchant), as: :json
    end

    assert_response 204
  end
end
