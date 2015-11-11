require 'spec_helper'


describe "Visit home page", :type => :feature do
  it "Visits home page" do
    visit "/"
    expect(page).to have_content 'Welcome'
  end
end


describe "Visits home page and logs in", :type => :feature do
  it "logs me in" do
    visit "/"
    within("#login") do
      accept_alert do
        page.find("a").click
      end
    end
    within("#authfb")do
      age.find("Facebook").click
    end
   
    expect(page).to have_content 'Welcome'
  end
end

describe "Visits All Flights page", :type => :feature do
  it "visits all flights page" do
    visit "/"
    click_on "All Flights"
    expect(page).to have_content '← Previous'
  end
end

# describe "Visits All Flights page", :type => :feature do
#   it "logs me in" do
#     visit "/flights"
#     click_on("Select")
#     expect(page).to have_content 'Book Flight'
#   end
# end





# describe "the signin process", :type => :feature do
#   it "signs me in" do
#     visit "/"
#     select "Alakia Airport, Ibadan", from: "flight"
#     select "Yola Airport, Yola", from: "flight"
#    	click_button "Search"
#     expect(page).to have_content 'Search Result for'
#   end
# end