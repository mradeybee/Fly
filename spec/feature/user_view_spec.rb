require 'rails_helper'

RSpec.feature "UserView"  do
  
  before(:each) do
    load "#{Rails.root}/spec/support/seed.rb" 
  end
  
  before(:each) do
    Seed.airports
    Seed.flights
  end

  describe "Visit home page", :type => :feature do
    it "Visits home page" do
      visit "/"
      expect(page).to have_content 'Welcome'
    end
  end

  describe "Visits All flight and booking page" do
    it "gets to flight booking page" do
      visit "/"
      click_on "All Flights"

      first(:button, "Select").click
      
      click_on 'Book Now'

      click_on 'Add Another passenger'
      expect(page).to have_content 'Book Flight'
    end
  end


   describe "Log In/Log out" do
    it "Logs in with facebook" do
      expect(User.count).to eq 0
      set_valid_omniauth
      visit "/"
      click_on "Log In"
      click_on 'Facebook'
      expect(User.count).to eq 1
      expect(page).to have_content "USER MOCK"
    end

    it "it doesn't log in with invalid facebook response" do
      expect(User.count).to eq 0
      set_invalid_omniauth
      visit "/"
      click_on "Log In"
      click_on 'Facebook'
      expect(User.count).not_to eq 1
      expect(page).not_to have_content "USER MOCK"
    end

    it "Logs out " do
      expect(User.count).to eq 0
      set_valid_omniauth
      visit "/"
      click_on "Log In"
      click_on 'Facebook'
      expect(User.count).to eq 1
      click_on "Sign Out"
      expect(page).to have_content "Please Sign Up or Login via the login button"
    end

  end

   describe "Search Flight", js: true do
    it "Search for flight without date " do
      visit "/"
      select "Akanu Ibiam International Airport, Enugu", from: "flight_origin_id"
      select "Port Harcourt International Airport, Port Harcourt", from: "flight_destination_id"
      click_on 'Search'
      expect(page).to have_content "No Flights Found"
   end

    it "Search for flight with date " do
      visit "/"
      flight= Flight.last
      select flight.origin.name, from: "flight_origin_id"
      select flight.destination.name, from: "flight_destination_id"
      fill_in('departure_date', :with => flight.departure_date.strftime("%Y - %m - %d"))
      click_on 'Search'
      expect(page).to have_content "Search results for flights from"
   end

     it "Search for flight with date on All flight page " do
      visit "/"
      click_on "All Flights"
      flight= Flight.last
      select flight.origin.name, from: "flight_origin_id"
      select flight.destination.name, from: "flight_destination_id"
      fill_in('departure_date', :with => flight.departure_date.strftime("%Y - %m - %d"))
      click_on 'Search'
      expect(page).to have_content "Search results for flights from"
   end

 end
end