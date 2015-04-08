class UsersController < ApplicationController
  def show
  	@user = current_user
  	@made_meals = current_user.made_meals.all
    @made_meal = @user.made_meals.build
  end
end
