module BookingsHelper
  def user_booked booking
    current_user.bookings.find_by booking_id: booking.id
  end
end
