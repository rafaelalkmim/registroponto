require "application_system_test_case"

class UsersEditsTest < ApplicationSystemTestCase
  setup do
    @users_edit = users_edits(:one)
  end

  test "visiting the index" do
    visit users_edits_url
    assert_selector "h1", text: "Users Edits"
  end

  test "creating a Users edit" do
    visit users_edits_url
    click_on "New Users Edit"

    click_on "Create Users edit"

    assert_text "Users edit was successfully created"
    click_on "Back"
  end

  test "updating a Users edit" do
    visit users_edits_url
    click_on "Edit", match: :first

    click_on "Update Users edit"

    assert_text "Users edit was successfully updated"
    click_on "Back"
  end

  test "destroying a Users edit" do
    visit users_edits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Users edit was successfully destroyed"
  end
end
