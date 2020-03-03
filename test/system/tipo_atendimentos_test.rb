require "application_system_test_case"

class TipoAtendimentosTest < ApplicationSystemTestCase
  setup do
    @tipo_atendimento = tipo_atendimentos(:one)
  end

  test "visiting the index" do
    visit tipo_atendimentos_url
    assert_selector "h1", text: "Tipo Atendimentos"
  end

  test "creating a Tipo atendimento" do
    visit tipo_atendimentos_url
    click_on "New Tipo Atendimento"

    fill_in "Descricao", with: @tipo_atendimento.descricao
    click_on "Create Tipo atendimento"

    assert_text "Tipo atendimento was successfully created"
    click_on "Back"
  end

  test "updating a Tipo atendimento" do
    visit tipo_atendimentos_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @tipo_atendimento.descricao
    click_on "Update Tipo atendimento"

    assert_text "Tipo atendimento was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo atendimento" do
    visit tipo_atendimentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo atendimento was successfully destroyed"
  end
end
