require "application_system_test_case"

class ReadingsTest < ApplicationSystemTestCase
  setup do
    @reading = readings(:one)
  end

  test "visiting the index" do
    visit readings_url
    assert_selector "h1", text: "Readings"
  end

  test "should create reading" do
    visit readings_url
    click_on "New reading"

    fill_in "Book", with: @reading.book_id
    fill_in "Rating", with: @reading.rating
    fill_in "Review", with: @reading.review
    fill_in "Status", with: @reading.status
    fill_in "User", with: @reading.user_id
    click_on "Create Reading"

    assert_text "Reading was successfully created"
    click_on "Back"
  end

  test "should update Reading" do
    visit reading_url(@reading)
    click_on "Edit this reading", match: :first

    fill_in "Book", with: @reading.book_id
    fill_in "Rating", with: @reading.rating
    fill_in "Review", with: @reading.review
    fill_in "Status", with: @reading.status
    fill_in "User", with: @reading.user_id
    click_on "Update Reading"

    assert_text "Reading was successfully updated"
    click_on "Back"
  end

  test "should destroy Reading" do
    visit reading_url(@reading)
    click_on "Destroy this reading", match: :first

    assert_text "Reading was successfully destroyed"
  end
end
