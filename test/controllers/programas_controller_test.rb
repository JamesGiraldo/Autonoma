require 'test_helper'

class ProgramasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get programas_index_url
    assert_response :success
  end

end
