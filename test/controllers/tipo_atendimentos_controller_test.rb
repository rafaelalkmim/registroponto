require 'test_helper'

class TipoAtendimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_atendimento = tipo_atendimentos(:one)
  end

  test "should get index" do
    get tipo_atendimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_atendimento_url
    assert_response :success
  end

  test "should create tipo_atendimento" do
    assert_difference('TipoAtendimento.count') do
      post tipo_atendimentos_url, params: { tipo_atendimento: { descricao: @tipo_atendimento.descricao } }
    end

    assert_redirected_to tipo_atendimento_url(TipoAtendimento.last)
  end

  test "should show tipo_atendimento" do
    get tipo_atendimento_url(@tipo_atendimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_atendimento_url(@tipo_atendimento)
    assert_response :success
  end

  test "should update tipo_atendimento" do
    patch tipo_atendimento_url(@tipo_atendimento), params: { tipo_atendimento: { descricao: @tipo_atendimento.descricao } }
    assert_redirected_to tipo_atendimento_url(@tipo_atendimento)
  end

  test "should destroy tipo_atendimento" do
    assert_difference('TipoAtendimento.count', -1) do
      delete tipo_atendimento_url(@tipo_atendimento)
    end

    assert_redirected_to tipo_atendimentos_url
  end
end
