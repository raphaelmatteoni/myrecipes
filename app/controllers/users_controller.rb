class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @recipes_shared_by_you = RecipeShare.where(recipe_id: Recipe.where(user_id: current_user.id))
    @recipes_shared_with_user = @user.recipe_shares.where(recipe_id: Recipe.where(user_id: current_user.id))
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
