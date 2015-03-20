class RecipesController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @recipe = current_user.recipes.build
    3.times { @recipe.items.build }
    3.times { @recipe.steps.build }
    @pantry = current_user.pantry
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe created."
      redirect_to Pantry.find(@recipe.user.pantry)
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @pantry = @recipe.user.pantry
  end

  def update
    if @recipe.update_attributes(recipe_params)
      flash[:success] = "Recipe updated."
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    flash[:success] = "Recipe deleted"
    redirect_to current_user.pantry
  end

  def index
    @recipes = current_user.recipes.all
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, items_attributes: [:id, :amount,
                                                               :unit,
                                                               :ingredients_id],
                                     steps_attributes: [:id, :instruction])
    end

    def correct_user
      @recipe = Recipe.find(params[:id])
      redirect_to(@recipe) unless (@recipe.user == current_user)
    end
end
