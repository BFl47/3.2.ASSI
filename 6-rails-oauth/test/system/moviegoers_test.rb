require "application_system_test_case"

class MoviegoersTest < ApplicationSystemTestCase
  setup do
    @moviegoer = moviegoers(:one)
  end

  test "visiting the index" do
    visit moviegoers_url
    assert_selector "h1", text: "Moviegoers"
  end

  test "creating a Moviegoer" do
    visit moviegoers_url
    click_on "New Moviegoer"

    fill_in "Name", with: @moviegoer.name
    fill_in "Uid", with: @moviegoer.uid
    click_on "Create Moviegoer"

    assert_text "Moviegoer was successfully created"
    click_on "Back"
  end

  test "updating a Moviegoer" do
    visit moviegoers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @moviegoer.name
    fill_in "Uid", with: @moviegoer.uid
    click_on "Update Moviegoer"

    assert_text "Moviegoer was successfully updated"
    click_on "Back"
  end

  test "destroying a Moviegoer" do
    visit moviegoers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Moviegoer was successfully destroyed"
  end
end
