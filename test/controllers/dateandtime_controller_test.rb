require "test_helper"

class DateandtimeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dateandtime_index_url
    assert_response :success
  end
end
