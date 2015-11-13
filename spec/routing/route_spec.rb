require 'rails_helper'

RSpec.describe "Routes", type: :routing do
  
  it "routes root path to pages controller and index action" do
    expect(get("/")).to route_to("pages#index")
  end

  it "routes to flight search" do
    expect(post("/flight_search")).to route_to("flights#flight_search")
  end

  it "routes to index search" do
    expect(post("/index_search")).to route_to("flights#index_search")
  end

  it "routes to flight index" do
    expect(get("/flights")).to route_to("flights#index")
  end

  it "routes to new bookings" do
    expect(get("/bookings/new")).to route_to("bookings#new")
  end
  
  it "routes to booking create" do
    expect(post("/bookings")).to route_to("bookings#create")
  end
     
  it "routes to booking index" do
    expect(:get => "booking_confirmed/:id").to route_to(
        :controller => "bookings",
        :action => "booking_confirmed",
        :id => ":id"
      )
  end
  
   it "routes booking edit" do
      expect(:get => "/bookings/:id/edit").to route_to(
        :controller => "bookings",
        :action => "edit",
        :id => ":id"
      )
    end

     it "routes booking update" do
      expect(:patch => "/bookings/:id").to route_to(
        :controller => "bookings",
        :action => "update",
        :id => ":id"
      )
    end

    it "routes to login or session create" do
      expect(:get => "/auth/:provider/callback").to route_to(
        :controller => "sessions",
        :action => "create",
        :provider => ":provider"
      )
    end  

    it "routes to cancel bookings" do
      expect(:delete => "/bookings/:id").to route_to(
        :controller => "bookings",
        :action => "destroy",
        :id => ":id"
      )
    end


    it "routes to sign_out or session destroy" do
      expect(:delete => "/sign_out").to route_to(
        :controller => "sessions",
        :action => "destroy",

      )
    end

    it "routes to user dashboard" do
      expect(get("/user_profile")).to route_to("bookings#user_profile")
    end
end