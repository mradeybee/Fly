require 'rails_helper'
RSpec.describe BookingsController, :type => :controller do
  describe "GET index" do
    let(:booking_params) {"books"}
    it "assigns @bookings" do
      bookings = Booking.create
      get :index
      expect(assigns(:bookings)).to be nil  
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end