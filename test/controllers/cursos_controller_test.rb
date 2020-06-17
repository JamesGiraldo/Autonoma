# frozen_string_literal: true

require 'test_helper'

class CursosControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get cursos_index_url
    assert_response :success
  end

  test 'should get show' do
    get cursos_show_url
    assert_response :success
  end

  test 'should get edit' do
    get cursos_edit_url
    assert_response :success
  end
end
