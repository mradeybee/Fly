# FLY
[![Coverage Status](https://coveralls.io/repos/andela-aadepoju/Fly/badge.svg?branch=master&service=github)](https://coveralls.io/github/andela-aadepoju/Fly?branch=master) [![Code Climate](https://codeclimate.com/github/andela-aadepoju/Fly/badges/gpa.svg)](https://codeclimate.com/github/andela-aadepoju/Fly)


##Introduction

Hello there, Fly is a flight booking system and it is written with rails. Just incase you dont know how rails applications walk, dont worry, I will walk you through the installation process and the app usage too.

##Features

This app enebles you to search for already registered flights and book the flight that you want. You can search for flights with date, your origin location and your destination. On the booking page, you will be able to create fields for any number of passengers you want to book. On successful booking of a flight, you will recieve a booking-success email. 

The option of paying via paypal is a work in progress and it should be completed in few days time.Other features include cancelling a booking before the day of the flight and also managing the number of passengers on a booking. You will also recieve a booking update email if you choose to manage your app. Check out the cool app here! Bug discoveries, suggestions and general feedback will always be appreciated.

##Getting Started

Now lets run this app. First you need to install <a href="https://www.ruby-lang.org" target ="blank">Ruby</a>  and <a href="http://rubyonrails.org/" target="blank">Rails</a>

##Dependencies

This project is implemented using the rails framework and as such in order to effectively run this project locally, you need to have the version 4 of Rails running on your local development machine. You also need to have at least Ruby 2.2.3 installed to have an awesome experince of the app, as rails is written in ruby.


You also need to make sure that you have Rubygems and Bundler installed. RubyGems is a package management framework for Ruby and bundler is a ruby gem that helps to manage other external dependencies in a rails application.

Once you have all the dependencies installed, you can now clone this repo to your local machine. Since you are here, I want to assume you know how to clone a repo.

From your command prompt or terminal, navigate to the app folder and run these commands
```
bundle install 
```
Bundle install takes care of all other dependencies that are required for this app to run. 

Once done, run the following command to prepare the database on your machine.
```
rake db:migrate
```
Then run the following command to preload the database with data.
```
rake db:seed
```
At this point, the app is ready to run. To run the app server, you need to run the rails console which runs on 'localhost:3000'. To start the rails server, run
```
rails s 
```
or 
```
rails server
```

##Running the tests.

After all the setting up as mentioned above, you can run the tests. The tests are driven by rspec, capybara and selenium. You can get them fired up by running the following command from the terminal.
```
rspec spec
```
or
```
bundle exec rspec
```
or
```
rake
```
If you need more specific tests, then specify the absolute path to the spec file:

bundle exec rspec spec/models/booking_spec.rb

If you want the tests to read more like a document then pass in these options to the rspec command:
```
bundle exec rspec spec/models/booking_spec.rb -f documentation
```	

The app is a work in progress, as such, it has the following limitations among others.

Booking can not be done via any other payment gateway.The app assumes that booking is cancelled when payment has not been made.App doesn't have a private domain name yet.

You can also check <a href="https://fly.herokuapp.com" target="blank">the hosted version</a> of this app

Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andela-aadepoju/Fly. 

