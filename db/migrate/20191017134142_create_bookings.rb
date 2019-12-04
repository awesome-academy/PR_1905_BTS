class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id ,foreign_key: true
      t.integer :payment
      t.integer :tour_id
      t.string :phone
      t.timestamps
    end
  end
end
