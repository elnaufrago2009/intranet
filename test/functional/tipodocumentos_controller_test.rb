require 'test_helper'

class TipodocumentosControllerTest < ActionController::TestCase
  setup do
    @tipodocumento = tipodocumentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipodocumentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipodocumento" do
    assert_difference('Tipodocumento.count') do
      post :create, tipodocumento: { descripcion: @tipodocumento.descripcion, nombre: @tipodocumento.nombre, tipodocumentoimg: @tipodocumento.tipodocumentoimg }
    end

    assert_redirected_to tipodocumento_path(assigns(:tipodocumento))
  end

  test "should show tipodocumento" do
    get :show, id: @tipodocumento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipodocumento
    assert_response :success
  end

  test "should update tipodocumento" do
    put :update, id: @tipodocumento, tipodocumento: { descripcion: @tipodocumento.descripcion, nombre: @tipodocumento.nombre, tipodocumentoimg: @tipodocumento.tipodocumentoimg }
    assert_redirected_to tipodocumento_path(assigns(:tipodocumento))
  end

  test "should destroy tipodocumento" do
    assert_difference('Tipodocumento.count', -1) do
      delete :destroy, id: @tipodocumento
    end

    assert_redirected_to tipodocumentos_path
  end
end
