require 'test_helper'

class RecipeSharesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_share = recipe_shares(:one)
  end

  test "should get index" do
    get recipe_shares_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_share_url
    assert_response :success
  end

  test "should create recipe_share" do
    assert_difference('RecipeShare.count') do
      post recipe_shares_url, params: { recipe_share: { recipe_id: @recipe_share.recipe_id, user_id: @recipe_share.user_id } }
    end

    assert_redirected_to recipe_share_url(RecipeShare.last)
  end

  test "should show recipe_share" do
    get recipe_share_url(@recipe_share)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_share_url(@recipe_share)
    assert_response :success
  end

  test "should update recipe_share" do
    patch recipe_share_url(@recipe_share), params: { recipe_share: { recipe_id: @recipe_share.recipe_id, user_id: @recipe_share.user_id } }
    assert_redirected_to recipe_share_url(@recipe_share)
  end

  test "should destroy recipe_share" do
    assert_difference('RecipeShare.count', -1) do
      delete recipe_share_url(@recipe_share)
    end

    assert_redirected_to recipe_shares_url
  end
end
