require "rails_helper"

RSpec.describe Flight, type: :model do
    
  let(:passenger){ Passenger.new }
  let(:has_name){passenger.name = "Adebayo"
    passenger}
  let(:has_email){passenger.email ="mradeybee@gmail.com"
    passenger}
  let(:has_booking_id){passenger.booking_id = 1
    passenger}
  let(:valid_passenger){
    has_name
    has_email
    has_booking_id
  } 

  let(:passenger_without_name){
    has_email
    has_booking_id
  }


  let(:passenger_without_email){
    has_name
    has_booking_id
  }

  it "Saves a valid passenger" do
    passenger.save
    expect(valid_passenger).to be_valid
  end 

  it "rejects passenger witout name" do
   passenger.save
    expect(passenger_without_name).not_to be_valid
  end
  
  it "rejects passenger without email" do
   passenger.save
    expect(passenger_without_email).not_to be_valid
  end
end