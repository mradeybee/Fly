require "rails_helper"

RSpec.describe Booking, type: :model do
	let(:booking){ Booking.new }
	let(:passenger){ Passenger.new(name: ['Adebayo', 'Olaide', 'Oscar', 'Chinedu', 'GO'].sample, email: Faker::Internet.email)
	}
  let(:flight){ Flight.first }

  let(:has_flight){ booking.flight = flight
  	booking
  	 }

  let(:has_passengers){
    5.times{booking.passengers << passenger }
    booking
  }

  let (:book){
  	has_flight
  	has_passengers
  }

  it "generates booking reference code" do
  	expect(booking.add_code.length).to eq(20)
  end

  it "books a flight" do
  	book.save
  	expect(book).to be_valid
  end

  it "has a valid passengers" do 
  	has_passengers.save
  	expect(has_passengers).to be_valid
  end

  it "it has a valid flight" do
  	has_flight.save
  	expect(has_flight).to be_valid
  end
end