class MadeMealsController < ApplicationController
  def new
  end

  def create
    @made_meal = current_user.made_meals.build(meal_params)
    if @made_meal.save
      flash[:success] = "You made a meal."
      redirect_to current_user
    else
      render @user
    end
  end

  private

  def meal_params
    params.require(:made_meal).permit(:recipe_id)
  end
end
