class BookingsController < ApplicationController
  def index
    
  end
  def new
    @book_info = booking_params 
  	@booking = Booking.new
    params[:no_of_passengers].to_i.times{@booking.passengers.build}
  end
 def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

 	private
	  def set_booking
	    @booking = Booking.find(params[:id])
	  end
	  
	  def booking_params
	    params.permit( :airline, :origin, :destination, :departure_date, :departure_time, 
        :arrival_date, :arrival_time, :flight_id, :price, :no_of_passengers,
        passenger_attributes:[:booking_id, :name, :email])
	  end

    
end