class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.integer :tour_id
      t.integer :price
      t.text :place
      t.datetime :start_at
      t.string :number_of_day

      t.timestamps
    end
  end
end
