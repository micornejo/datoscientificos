require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get buenas_practicas" do
    get :buenas_practicas
    assert_response :success
  end

end
