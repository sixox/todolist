require "application_system_test_case"

class InquriesTest < ApplicationSystemTestCase
  setup do
    @inqury = inquries(:one)
  end

  test "visiting the index" do
    visit inquries_url
    assert_selector "h1", text: "Inquries"
  end

  test "should create inqury" do
    visit inquries_url
    click_on "New inqury"

    fill_in "Company", with: @inqury.company
    fill_in "Country", with: @inqury.country
    fill_in "Email", with: @inqury.email
    fill_in "Full name", with: @inqury.full_name
    fill_in "Packing", with: @inqury.packing
    fill_in "Phone", with: @inqury.phone
    fill_in "Port", with: @inqury.port
    fill_in "Product", with: @inqury.product
    fill_in "Quantity", with: @inqury.quantity
    click_on "Create Inqury"

    assert_text "Inqury was successfully created"
    click_on "Back"
  end

  test "should update Inqury" do
    visit inqury_url(@inqury)
    click_on "Edit this inqury", match: :first

    fill_in "Company", with: @inqury.company
    fill_in "Country", with: @inqury.country
    fill_in "Email", with: @inqury.email
    fill_in "Full name", with: @inqury.full_name
    fill_in "Packing", with: @inqury.packing
    fill_in "Phone", with: @inqury.phone
    fill_in "Port", with: @inqury.port
    fill_in "Product", with: @inqury.product
    fill_in "Quantity", with: @inqury.quantity
    click_on "Update Inqury"

    assert_text "Inqury was successfully updated"
    click_on "Back"
  end

  test "should destroy Inqury" do
    visit inqury_url(@inqury)
    click_on "Destroy this inqury", match: :first

    assert_text "Inqury was successfully destroyed"
  end
end
