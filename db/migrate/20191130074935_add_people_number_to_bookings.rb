class AddPeopleNumberToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :people_number, :integer
  end
end
