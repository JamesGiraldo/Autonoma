require 'test_helper'

class FacultadesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get facultades_index_url
    assert_response :success
  end
end
