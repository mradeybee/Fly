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

	describe "Unregistered user" do
	  it "books a flight" do
	    visit "/"
	    click_on "All Flights"

	    first(:button, "Select").click
 			
	    click_on 'Book Now'

	    click_on 'Add Another passenger'
	    expect(page).to have_content 'Book Flight'
	  end
	end


end