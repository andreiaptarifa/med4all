require "test_helper"

class MedicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get medications_index_url
    assert_response :success
  end
end
