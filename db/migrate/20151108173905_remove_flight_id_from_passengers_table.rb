class RemoveFlightIdFromPassengersTable < ActiveRecord::Migration
  def change
  	remove_column :passengers, :flight_id, :interger
  end
end
