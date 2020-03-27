require 'test_helper'

class ProyeccionesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get proyecciones_index_url
    assert_response :success
  end

  test 'should get show' do
    get proyecciones_show_url
    assert_response :success
  end

  test 'should get edit' do
    get proyecciones_edit_url
    assert_response :success
  end
end
