class RecipeSharesController < ApplicationController
  before_action :set_recipe_share, only: [:destroy]
  
  def index
    @recipe_shares = current_user.recipe_shares  
  end

  def new
    @recipe_share = RecipeShare.new
    @recipe_share.recipe_id = params[:recipe_id]
  end

  def create
    @recipe_share = RecipeShare.new(recipe_share_params)

    respond_to do |format|
      if @recipe_share.save
        format.html { redirect_to recipes_path, notice: "Receita #{@recipe_share.recipe.title} compartilhada com #{@recipe_share.user.name}" }
        format.json { render :show, status: :created, location: @recipe_share }
      else
        format.html { render :new }
        format.json { render json: @recipe_share.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_share.destroy
    respond_to do |format|
      format.html { redirect_to recipe_shares_url, notice: 'Recipe share was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_share
      @recipe_share = RecipeShare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_share_params
      params.require(:recipe_share).permit(:recipe_id, :user_id)
    end
end
