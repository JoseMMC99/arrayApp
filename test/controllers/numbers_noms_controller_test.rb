require "test_helper"

class NumbersNomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @numbers_nom = numbers_noms(:one)
  end

  test "should get index" do
    get numbers_noms_url, as: :json
    assert_response :success
  end

  test "should create numbers_nom" do
    assert_difference('NumbersNom.count') do
      post numbers_noms_url, params: { numbers_nom: { nums: @numbers_nom.nums } }, as: :json
    end

    assert_response 201
  end

  test "should show numbers_nom" do
    get numbers_nom_url(@numbers_nom), as: :json
    assert_response :success
  end

  test "should update numbers_nom" do
    patch numbers_nom_url(@numbers_nom), params: { numbers_nom: { nums: @numbers_nom.nums } }, as: :json
    assert_response 200
  end

  test "should destroy numbers_nom" do
    assert_difference('NumbersNom.count', -1) do
      delete numbers_nom_url(@numbers_nom), as: :json
    end

    assert_response 204
  end
end
