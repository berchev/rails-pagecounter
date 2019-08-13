require 'test_helper'

class CounterControllerTest < ActionDispatch::IntegrationTest
  test "should get menu" do
    get counter_menu_url
    assert_response :success
  end

  test "should get incr" do
    get counter_incr_url
    assert_response :success
  end

  test "should get decr" do
    get counter_decr_url
    assert_response :success
  end

  test "should get reset" do
    get counter_reset_url
    assert_response :success
  end

end
