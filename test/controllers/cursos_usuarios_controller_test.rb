require 'test_helper'

class CursosUsuariosControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get cursos_usuarios_index_url
    assert_response :success
  end

  test 'should get new' do
    get cursos_usuarios_new_url
    assert_response :success
  end

  test 'should get edit' do
    get cursos_usuarios_edit_url
    assert_response :success
  end

  test 'should get show' do
    get cursos_usuarios_show_url
    assert_response :success
  end
end
