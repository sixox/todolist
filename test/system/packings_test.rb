require "application_system_test_case"

class PackingsTest < ApplicationSystemTestCase
  setup do
    @packing = packings(:one)
  end

  test "visiting the index" do
    visit packings_url
    assert_selector "h1", text: "Packings"
  end

  test "should create packing" do
    visit packings_url
    click_on "New packing"

    fill_in "Description", with: @packing.description
    fill_in "Name", with: @packing.name
    fill_in "Product", with: @packing.product_id
    click_on "Create Packing"

    assert_text "Packing was successfully created"
    click_on "Back"
  end

  test "should update Packing" do
    visit packing_url(@packing)
    click_on "Edit this packing", match: :first

    fill_in "Description", with: @packing.description
    fill_in "Name", with: @packing.name
    fill_in "Product", with: @packing.product_id
    click_on "Update Packing"

    assert_text "Packing was successfully updated"
    click_on "Back"
  end

  test "should destroy Packing" do
    visit packing_url(@packing)
    click_on "Destroy this packing", match: :first

    assert_text "Packing was successfully destroyed"
  end
end
