require "test_helper"

class PharmaciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pharmacies_index_url
    assert_response :success
  end
end
