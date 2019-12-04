class AddPhoneToBooking < ActiveRecord::Migration[5.2]
  def change
      add_column :bookings, :phone, :string
      add_column :comments, :review_id, :integer
  end
end
