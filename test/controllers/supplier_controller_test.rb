require 'test_helper'

class SupplierControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
