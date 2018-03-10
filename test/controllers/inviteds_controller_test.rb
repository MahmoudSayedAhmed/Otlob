require 'test_helper'

class InvitedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invited = inviteds(:one)
  end

  test "should get index" do
    get inviteds_url
    assert_response :success
  end

  test "should get new" do
    get new_invited_url
    assert_response :success
  end

  test "should create invited" do
    assert_difference('Invited.count') do
      post inviteds_url, params: { invited: { order_id: @invited.order_id, user_id: @invited.user_id } }
    end

    assert_redirected_to invited_url(Invited.last)
  end

  test "should show invited" do
    get invited_url(@invited)
    assert_response :success
  end

  test "should get edit" do
    get edit_invited_url(@invited)
    assert_response :success
  end

  test "should update invited" do
    patch invited_url(@invited), params: { invited: { order_id: @invited.order_id, user_id: @invited.user_id } }
    assert_redirected_to invited_url(@invited)
  end

  test "should destroy invited" do
    assert_difference('Invited.count', -1) do
      delete invited_url(@invited)
    end

    assert_redirected_to inviteds_url
  end
end
