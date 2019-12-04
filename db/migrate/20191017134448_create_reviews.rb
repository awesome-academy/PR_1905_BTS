class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :tour_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
