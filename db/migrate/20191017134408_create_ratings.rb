class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :user_id, foreign_key: true
      t.integer :tour_id
      t.integer :star

      t.timestamps
    end
  end
end
