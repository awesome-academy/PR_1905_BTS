class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :paymentID
      t.integer :booking_id
      t.string :purchase_at

      t.timestamps
    end
  end
end
