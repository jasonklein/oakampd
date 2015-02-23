require 'test_helper'

class BandsControllerTest < ActionController::TestCase
  test "should get bandwatch" do
    get :bandwatch
    assert_response :success
  end

end
