require "test_helper"

class NumberArraysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @number_array = number_arrays(:one)
  end

  test "should get index" do
    get number_arrays_url, as: :json
    assert_response :success
  end

  test "should create number_array" do
    assert_difference('NumberArray.count') do
      post number_arrays_url, params: { number_array: { nums: @number_array.nums } }, as: :json
    end

    assert_response 201
  end

  test "should show number_array" do
    get number_array_url(@number_array), as: :json
    assert_response :success
  end

  test "should update number_array" do
    patch number_array_url(@number_array), params: { number_array: { nums: @number_array.nums } }, as: :json
    assert_response 200
  end

  test "should destroy number_array" do
    assert_difference('NumberArray.count', -1) do
      delete number_array_url(@number_array), as: :json
    end

    assert_response 204
  end
end
