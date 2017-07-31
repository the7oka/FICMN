require 'test_helper'

class Cp::CatsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get cp_cats_edit_url
    assert_response :success
  end

end
