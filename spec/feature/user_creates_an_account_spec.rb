# require 'spec_helper'
# RSpec.feature "UserCreatesAnAccount", type: :feature do

# describe "Visit home page", :type => :feature do
#   it "Visits home page" do
#     visit "/"
#     expect(page).to have_content 'Welcome'
#   end
# end


# describe "Visits home page and logs in", :type => :feature do
#   it "Selects Flights" do
#     visit "/"
#       # require 'pry';binding.pry
#       # page.find_by_id('seachform').find(".origin[value='Yola Airport, Yola']").select_option
#       # page.find_by_id('seachform').find(".destination[value='Alakia Airport, Ibadan']").select_option
#       find("#seachform").find(:flight, ".origin", ["value = '3'"]).select_option
#       find("#seachform").find(:flight, ".destination",["value = '4'"]).select_option
#       find("#seachform").find(:flight, ".date", "11").select_option
#       click_on ("Search")
#     expect(page).to have_content("Search results for flights from Ibadan to Akure")
#   end
# end
# # background do
# #    set_omniauth()
# #    visit "/"
# #    click_link ("Log In")
# #    click_link ("Facebook")
# #    expect(page).to have_content 'Welcome'
# # end

# # describe "access top page" do
# #   it "can sign in user with Twitter account" do
# #     visit '/'
# #     click_link ("Log In")
# #     click_link ("Facebook")
# #     mock_auth_hash
# #     click_link "Sign in"
# #     page.should have_content("mockuser")  # user name
# #     page.should have_css('img', :src => 'mock_user_thumbnail_url') # user image
# #     page.should have_content("Sign out")
# #   end


# describe "Visits All Flights page", :type => :feature do
#   it "visits all flights page" do
#     visit "/"
#     click_on "All Flights"
#     expect(page).to have_content '← Previous'
#   end
# end
# end
# # describe "Visits All Flights page", :type => :feature do
# #   it "logs me in" do
# #     visit "/flights"
# #     click_on("Select")
# #     expect(page).to have_content 'Book Flight'
# #   end
# # end





# # describe "the signin process", :type => :feature do
# #   it "signs me in" do
# #     visit "/"
# #     select "Alakia Airport, Ibadan", from: "flight"
# #     select "Yola Airport, Yola", from: "flight"
# #    	click_button "Search"
# #     expect(page).to have_content 'Search Result for'
# #   end
# # end