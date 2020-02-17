require 'test_helper'

class ComentariosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comentarios_index_url
    assert_response :success
  end

end
