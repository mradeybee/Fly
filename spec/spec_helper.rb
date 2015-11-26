require 'coveralls'
require 'phantomjs'
Coveralls.wear!

RSpec.configure do |config|
  
  config.expect_with :rspec do |expectations|
   
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
   
    mocks.verify_partial_doubles = true
  end


	# Capybara.configure do |config|
	#   # config.run_server = false
	#   # config.default_driver = :selenium
	#   # config.app_host = 'http://localhost:3000' # change url
	# end

	require 'capybara/poltergeist'
	Capybara.javascript_driver = :poltergeist
	Capybara.register_driver :poltergeist do |app|
  	Capybara::Poltergeist::Driver.new(app, {js_errors:true, port:44678+ENV['RAILS_ENV'].to_i, phantomjs_options:['--proxy-type=none'], timeout:180})
	end

end
