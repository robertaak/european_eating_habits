require "application_system_test_case"

class EntriesTest < ApplicationSystemTestCase
  setup do
    @entry = entries(:one)
  end

  test "visiting the index" do
    visit entries_url
    assert_selector "h1", text: "Entries"
  end

  test "creating a Entry" do
    visit entries_url
    click_on "New Entry"

    fill_in "Consumers", with: @entry.consumers
    fill_in "Country", with: @entry.country
    fill_in "Food group", with: @entry.food_group
    fill_in "Mean", with: @entry.mean
    fill_in "Population group", with: @entry.population_group
    fill_in "Subjects", with: @entry.subjects
    click_on "Create Entry"

    assert_text "Entry was successfully created"
    click_on "Back"
  end

  test "updating a Entry" do
    visit entries_url
    click_on "Edit", match: :first

    fill_in "Consumers", with: @entry.consumers
    fill_in "Country", with: @entry.country
    fill_in "Food group", with: @entry.food_group
    fill_in "Mean", with: @entry.mean
    fill_in "Population group", with: @entry.population_group
    fill_in "Subjects", with: @entry.subjects
    click_on "Update Entry"

    assert_text "Entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Entry" do
    visit entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entry was successfully destroyed"
  end
end
