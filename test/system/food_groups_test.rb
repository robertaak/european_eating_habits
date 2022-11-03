require "application_system_test_case"

class FoodGroupsTest < ApplicationSystemTestCase
  setup do
    @food_group = food_groups(:one)
  end

  test "visiting the index" do
    visit food_groups_url
    assert_selector "h1", text: "Food Groups"
  end

  test "creating a Food group" do
    visit food_groups_url
    click_on "New Food Group"

    fill_in "Name", with: @food_group.name
    click_on "Create Food group"

    assert_text "Food group was successfully created"
    click_on "Back"
  end

  test "updating a Food group" do
    visit food_groups_url
    click_on "Edit", match: :first

    fill_in "Name", with: @food_group.name
    click_on "Update Food group"

    assert_text "Food group was successfully updated"
    click_on "Back"
  end

  test "destroying a Food group" do
    visit food_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Food group was successfully destroyed"
  end
end
