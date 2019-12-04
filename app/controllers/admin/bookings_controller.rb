class Admin::BookingsController < Admin::BaseController
  def index
    @bookings = Booking.all
  end

  def update
    @booking = Booking.find_by id: params[:id]
    if params[:approve]
      @booking.success!
      flash[:success] = "Approved"
    else
      @booking.cancel!
      flash.now[:danger] = "Rejected"
    end
    redirect_to admin_bookings_path
  end
end
