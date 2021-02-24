class BookingsController < ApplicationController

  before_action :set_booking, only: [:edit, :update, :show, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.new(booking_params)
    @booking.spaceship = @spaceship

    @booking.user = current_user
    if @booking.save
      redirect_to booking_params(@booking)
    else
      render :new
    end
 end

  def edit
  end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to booking_params(@booking)
    else
      render :edit
    end
  end


  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end





