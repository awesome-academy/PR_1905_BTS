class BookingsController < ApplicationController
  before_action :logged_in_user
  before_action :load_tour
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.build booking_params
    @booking.tour = @tour
    if @booking.save
      flash[:success] = "booking success"
      redirect_to bookings_path
    else
      flash.now[:danger] = " cant booking "
      render "new"
    end
  end

  def destroy
    Booking.find(params[:id]).destroy
    flash[:success] = "book tour deleted"
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:phone, :people_number, :status)
  end

  def load_tour
    @tour = Tour.find_by id: params[:tour_id]
  end
end
