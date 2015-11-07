class AddBookingCodeFieldToBookingsTable < ActiveRecord::Migration
  def change
    add_column :bookings, :code, :string
  end
end
