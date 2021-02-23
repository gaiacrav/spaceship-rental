class SpaceshipsController < ApplicationController

before_action :set_spaceship, only: [:show]

  def index
    @spaceship = Spaceship.all
  end

  def show
    @reviews = Spaceship.reviews
  end

  def new
    @spaceship = Spacehip.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    if @spaceship.save
      redirect_to spaceship_params(@spaceship)
    else
      render :new
    end
  end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end

  def spaceship_params
    params.require(:spaceship).permit(:name, :destination, :price, :photo, :description)
  end
end


end
