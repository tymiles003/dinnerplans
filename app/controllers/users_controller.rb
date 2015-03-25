class UsersController < ApplicationController
  def show
  	@user = current_user
    @made_meal = @user.made_meals.build
  end
end
