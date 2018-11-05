require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get games_new_url
    assert_response :success
  end

  test "should get show" do
    get games_show_url
    assert_response :success
  end

  test "should get update" do
    get games_update_url
    assert_response :success
  end

  test "should get waitresult" do
    get games_waitresult_url
    assert_response :success
  end

  test "should get play" do
    get games_play_url
    assert_response :success
  end

end
