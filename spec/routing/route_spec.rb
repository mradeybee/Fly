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
  
  it "routes to booking update" do
    expect(post("/bookings")).to route_to("bookings#create")
  end
  # it "routes to booking index" do
  #   expect(get("/bookings/:id/edit")).to route_to("bookings#edit")
  # end
  #   it "routes to booking index" do
  #   expect(get("/bookings")).to route_to("bookings#index")
  # end


    it "routes logout path to sessions controller and destroy action" do
      expect(:get => "/bookings/:id/edit").to route_to(
        :controller => "bookings",
        :action => "edit",
        :id => ":id"
      )
    end

    # it "routes google OAuth path to sessions controller and create action" do
    #   expect(:get => "/auth/:provider/callback").to route_to(
    #     :controller => "sessions",
    #     :action => "create",
    #     :provider => ":provider"
    #   )
    # end

    # it "routes flights/all path to flights controller and index action" do
    #   expect(get("flights/all")).to route_to("flights#index")
    # end

    # it "routes search path to flights controller and search action" do
    #   expect(get("flights/search")).to route_to("flights#search")
    # end

    # it "routes make_booking path to bookings controller and new action" do
    #   expect(get("booking/make_booking")).to route_to("bookings#new")
    # end

    # it "routes root path to bookings controller and create action" do
    #   expect(post("to_booking")).to route_to("bookings#create")
    # end

    # it "routes root path to bookings controller and index action" do
    #   expect(get("dashboard")).to route_to("bookings#index")
    # end

end