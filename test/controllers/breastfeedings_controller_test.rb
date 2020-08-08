require 'test_helper'

class BreastfeedingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @breastfeeding = breastfeedings(:one)
  end

  test "should get index" do
    get breastfeedings_url
    assert_response :success
  end

  test "should get new" do
    get new_breastfeeding_url
    assert_response :success
  end

  test "should create breastfeeding" do
    assert_difference('Breastfeeding.count') do
      post breastfeedings_url, params: { breastfeeding: { baby_id: @breastfeeding.baby_id, duration: @breastfeeding.duration, quantity: @breastfeeding.quantity } }
    end

    assert_redirected_to breastfeeding_url(Breastfeeding.last)
  end

  test "should show breastfeeding" do
    get breastfeeding_url(@breastfeeding)
    assert_response :success
  end

  test "should get edit" do
    get edit_breastfeeding_url(@breastfeeding)
    assert_response :success
  end

  test "should update breastfeeding" do
    patch breastfeeding_url(@breastfeeding), params: { breastfeeding: { baby_id: @breastfeeding.baby_id, duration: @breastfeeding.duration, quantity: @breastfeeding.quantity } }
    assert_redirected_to breastfeeding_url(@breastfeeding)
  end

  test "should destroy breastfeeding" do
    assert_difference('Breastfeeding.count', -1) do
      delete breastfeeding_url(@breastfeeding)
    end

    assert_redirected_to breastfeedings_url
  end
end
