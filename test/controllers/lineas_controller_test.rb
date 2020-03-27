require 'test_helper'

class LineasControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get lineas_index_url
    assert_response :success
  end
end
