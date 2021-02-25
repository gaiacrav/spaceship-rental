class SpaceshipsController < ApplicationController

 before_action :set_spaceship, only: [:show]

  def index
    if params[:query].present?
      @spaceships = Spaceship.global_search(params[:query])
    else
      @spaceships = Spaceship.all
    end
  end

  def show
    @spaceship = Spaceship.find(params[:id])
    @booking = Booking.new
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    if @spaceship.save
      redirect_to spaceships_path
    else
      render :new
    end
 end

 def edit
  @spaceship = Spaceship.find(params[:id])
  @spaceship.user.admin = current_user
 end

  def update
    @spaceship = Spaceship.find(params[:id])
    @spaceship.update(spaceship_params)

    redirect_to spaceship_path(@spaceship)
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

