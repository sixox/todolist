require "test_helper"

class InquriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inqury = inquries(:one)
  end

  test "should get index" do
    get inquries_url
    assert_response :success
  end

  test "should get new" do
    get new_inqury_url
    assert_response :success
  end

  test "should create inqury" do
    assert_difference("Inqury.count") do
      post inquries_url, params: { inqury: { company: @inqury.company, country: @inqury.country, email: @inqury.email, full_name: @inqury.full_name, packing: @inqury.packing, phone: @inqury.phone, port: @inqury.port, product: @inqury.product, quantity: @inqury.quantity } }
    end

    assert_redirected_to inqury_url(Inqury.last)
  end

  test "should show inqury" do
    get inqury_url(@inqury)
    assert_response :success
  end

  test "should get edit" do
    get edit_inqury_url(@inqury)
    assert_response :success
  end

  test "should update inqury" do
    patch inqury_url(@inqury), params: { inqury: { company: @inqury.company, country: @inqury.country, email: @inqury.email, full_name: @inqury.full_name, packing: @inqury.packing, phone: @inqury.phone, port: @inqury.port, product: @inqury.product, quantity: @inqury.quantity } }
    assert_redirected_to inqury_url(@inqury)
  end

  test "should destroy inqury" do
    assert_difference("Inqury.count", -1) do
      delete inqury_url(@inqury)
    end

    assert_redirected_to inquries_url
  end
end
