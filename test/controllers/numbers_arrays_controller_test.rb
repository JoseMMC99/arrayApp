require "test_helper"

class NumbersArraysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @numbers_array = numbers_arrays(:one)
  end

  test "should get index" do
    get numbers_arrays_url, as: :json
    assert_response :success
  end

  test "should create numbers_array" do
    assert_difference('NumbersArray.count') do
      post numbers_arrays_url, params: { numbers_array: { nums: @numbers_array.nums } }, as: :json
    end

    assert_response 201
  end

  test "should show numbers_array" do
    get numbers_array_url(@numbers_array), as: :json
    assert_response :success
  end

  test "should update numbers_array" do
    patch numbers_array_url(@numbers_array), params: { numbers_array: { nums: @numbers_array.nums } }, as: :json
    assert_response 200
  end

  test "should destroy numbers_array" do
    assert_difference('NumbersArray.count', -1) do
      delete numbers_array_url(@numbers_array), as: :json
    end

    assert_response 204
  end
end
