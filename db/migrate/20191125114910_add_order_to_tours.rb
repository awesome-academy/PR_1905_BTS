class AddOrderToTours < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :order_status, :integer, null: false, default: 0
  end
end
