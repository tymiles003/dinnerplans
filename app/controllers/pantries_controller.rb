class PantriesController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :existing_pantry?, only: [:new]

  def new
    @pantry = current_user.build_pantry
    @pantry.ingredients.build
  end

  def create
    @pantry = current_user.build_pantry(pantry_params)
  	if @pantry.save
  	  flash[:success] = "Pantry created!"
  	  redirect_to @pantry
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
    if @pantry.update_attributes(pantry_params)
      flash[:success] = "Pantry updated."
      redirect_to @pantry
    else
      render 'edit'
    end
  end


  def show
    @pantry = Pantry.find(params[:id])
    @user = User.find(@pantry.user_id)
  end

  private

    def pantry_params
  	  params.require(:pantry).permit(ingredients_attributes: [:id, :name, :category, :amount, :unit, :_destroy])
    end

    def correct_user
      @pantry = Pantry.find(params[:id])
      redirect_to(@pantry) unless (@pantry.user == current_user)
    end

    def existing_pantry?
      if current_user.pantry
        flash[:alert] = "You already have a pantry."
        redirect_to current_user.pantry unless current_user.pantry.nil?
      end
    end


end
