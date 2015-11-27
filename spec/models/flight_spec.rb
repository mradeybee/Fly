require "rails_helper"

RSpec.describe Flight, type: :model do
  before(:each) do
    load "#{Rails.root}/spec/support/seed.rb"
    Seed.airports
  end
  
  let(:flight){ Flight.new }
  let(:has_origin){flight.origin = Airport.first
    flight}
  let(:has_destination){flight.destination = Airport.last
    flight}
  let(:has_departure_date){ flight.departure_date = Date.today + 1.hour
    flight}
  let(:has_arrival_date){ flight.arrival_date = Date.today + 2.hour 
    flight}
  let(:valid_flight){ 
    has_origin
    has_destination
    has_departure_date
    has_arrival_date
     }

    let(:flight_without_origin){ 
    has_destination
    has_departure_date
    has_arrival_date
     }

    let(:flight_without_destination){ 
    has_origin
    has_departure_date
    has_arrival_date
     }

    let(:flight_without_departure_date){ 
    has_origin
    has_destination
    has_arrival_date
     }

    let(:flight_without_arrival_date){ 
    has_origin
    has_destination
    has_departure_date
     }

  it "generates a valid flight" do
    flight.save
    expect(valid_flight).to be_valid
  end 

  it "rejects flights witout origin" do
    flight.save
    expect(flight_without_origin).not_to be_valid
  end
  
  it "rejects flights witout destination" do
    flight.save
    expect(flight_without_destination).not_to be_valid
  end
  
  it "rejects flights witout departure_date" do
    flight.save
    expect(flight_without_departure_date).not_to be_valid
  end

  it "rejects flights witout arrival_date" do
    flight.save
    expect(flight_without_arrival_date).not_to be_valid
  end

  it "searches flight" do
    Seed.flights
    my_flight = Flight.search(1, 2, Date.yesterday)
    expect(my_flight).to be_empty
  end
end