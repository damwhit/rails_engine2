require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get api_v1_items_url, as: :json
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post api_v1_items_url, params: { description: @item.description, merchant_id: @item.merchant_id, name: @item.name, unit_price: @item.unit_price }, as: :json
    end

    assert_response 201
  end

  test "should show item" do
    get api_v1_item_url(@item), as: :json
    assert_response :success
  end

  test "should update item" do
    patch api_v1_item_url(@item), params: { description: @item.description, merchant_id: @item.merchant_id, name: @item.name, unit_price: @item.unit_price }, as: :json
    assert_response 200
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete api_v1_item_url(@item), as: :json
    end

    assert_response 204
  end
end
