require 'rails_helper'
RSpec.describe BookingsController, :type => :controller do
  subject(:bookings) { Booking.new(flight_id: flight_id, user_id: current_user.id, code: code)}
  let(:current_user){set_valid_omniauth}
  let(:flight_id){1}
  let(:code){1}

  before :each do
    load "#{Rails.root}/spec/support/seed.rb" 
    Seed.booking
  end

  describe "GET index" do
    it "assigns @bookings" do
      get :index
      expect(:bookings).not_to be nil  
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end 
  end

  describe "user_profile" do
    it "rejects disalows unregistered users to view dashboard" do
      bookings = Booking.where(user_id: current_user.id)
      get :user_profile
      expect(response).to redirect_to(root_path)
    end
  end

  it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
end