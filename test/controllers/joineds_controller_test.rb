require 'test_helper'

class JoinedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @joined = joineds(:one)
  end

  test "should get index" do
    get joineds_url
    assert_response :success
  end

  test "should get new" do
    get new_joined_url
    assert_response :success
  end

  test "should create joined" do
    assert_difference('Joined.count') do
      post joineds_url, params: { joined: { order_id: @joined.order_id, user_id: @joined.user_id } }
    end

    assert_redirected_to joined_url(Joined.last)
  end

  test "should show joined" do
    get joined_url(@joined)
    assert_response :success
  end

  test "should get edit" do
    get edit_joined_url(@joined)
    assert_response :success
  end

  test "should update joined" do
    patch joined_url(@joined), params: { joined: { order_id: @joined.order_id, user_id: @joined.user_id } }
    assert_redirected_to joined_url(@joined)
  end

  test "should destroy joined" do
    assert_difference('Joined.count', -1) do
      delete joined_url(@joined)
    end

    assert_redirected_to joineds_url
  end
end
