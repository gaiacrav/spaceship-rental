class PagesController < ApplicationController
  def home
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end



end
