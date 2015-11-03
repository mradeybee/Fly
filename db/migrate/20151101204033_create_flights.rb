class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :airline
      t.integer :origin_id
      t.integer :destination_id
      t.string :price
      t.datetime :departure_date
      t.datetime :arrival_date

      t.timestamps null: false
    end
  end
end
