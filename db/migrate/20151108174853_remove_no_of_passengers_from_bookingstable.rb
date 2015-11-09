class RemoveNoOfPassengersFromBookingstable < ActiveRecord::Migration
  def change
  	 remove_column :bookings, :no_of_passengers, :integer
  end
end
