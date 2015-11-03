class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :flight_id
      t.integer :user_id
      t.integer :no_of_passengers

      t.timestamps null: false
    end
  end
end
