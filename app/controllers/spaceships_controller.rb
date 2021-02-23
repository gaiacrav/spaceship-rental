class SpaceshipsController < ApplicationController

before_action :set_spaceship, only: [:show]

  def index
    @spaceships = Spaceship.all
  end

  def show
    @spaceship = Spaceship.find(params[:id])
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    if @spaceship.save
      redirect_to spaceship_params(@spaceship)
    else
      render :new
    end
 end

  def destroy
    @spaceship = Spaceship.find(params[:id])
    @spaceship.destroy
    redirect_to root_path
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :destination, :price, :photo, :description)
  end
end

