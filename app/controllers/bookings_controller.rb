class BookingsController < ApplicationController
  before_action :logged_in_user
  before_action :load_tour
  def create
    @booking = current_user.bookings.build booking_params
    @booking.tour = @tour
    if @booking.save
      flash.now[:success] = "booking success"
      redirect_to tours_path
    else
      flash.now[:dagger] = "booking fail"
      redirect_to tours_path
    end
  end
  def destroy

  end
  private
  def booking_params
    params.require(:booking).permit(:quantity, :tour_id, :user_id)
  end

  def load_tour
    @tour = Tour.find_by id: params[:tour_id]
  end
end
