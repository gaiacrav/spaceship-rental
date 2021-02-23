class BookingsController < ApplicationController

before_action :set_booking, only: [:show]

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
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_params(@booking)
    else
      render :new
    end
 end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path
  end

  private

  def spaceship_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end





