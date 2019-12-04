class RemoveNumberPeopleToBooking < ActiveRecord::Migration[5.2]
  def change
  remove_column :bookings, :number_people
  remove_column :bookings, :quantity
  remove_column :bookings, :price
  remove_column :tours, :order_status
  end
end
