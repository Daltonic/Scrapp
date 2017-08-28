require 'test_helper'

class ScrappiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scrappy = scrappies(:one)
  end

  test "should get index" do
    get scrappies_url
    assert_response :success
  end

  test "should get new" do
    get new_scrappy_url
    assert_response :success
  end

  test "should create scrappy" do
    assert_difference('Scrappy.count') do
      post scrappies_url, params: { scrappy: { brand: @scrappy.brand, name: @scrappy.name, price: @scrappy.price } }
    end

    assert_redirected_to scrappy_url(Scrappy.last)
  end

  test "should show scrappy" do
    get scrappy_url(@scrappy)
    assert_response :success
  end

  test "should get edit" do
    get edit_scrappy_url(@scrappy)
    assert_response :success
  end

  test "should update scrappy" do
    patch scrappy_url(@scrappy), params: { scrappy: { brand: @scrappy.brand, name: @scrappy.name, price: @scrappy.price } }
    assert_redirected_to scrappy_url(@scrappy)
  end

  test "should destroy scrappy" do
    assert_difference('Scrappy.count', -1) do
      delete scrappy_url(@scrappy)
    end

    assert_redirected_to scrappies_url
  end
end
