class PantriesController < ApplicationController
  def show
  	@pantry = Pantry.find(params[:id])
  end

  def new
  	@pantry = Pantry.new
  end
end
