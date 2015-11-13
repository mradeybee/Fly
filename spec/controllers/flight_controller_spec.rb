require 'rails_helper'
RSpec.describe FlightsController, :type => :controller do
  subject(:flights) { flight.new(flight_id: flight_id, user_id: current_user.id, code: code)}
  let(:current_user){set_valid_omniauth}
  let(:flight_id){1}
  let(:code){1}

    describe "GET index" do
    it "assigns @flights" do
      get :index
      expect(:flights).not_to be nil  
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end 
  end
end