class BookingsController < ApplicationController
  def index
  end

  def new
   	@booking = Booking.new(new_booking_params)
    @booking.user_id = current_user.id if current_user
  end

  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if booking_params[:passengers_attributes].nil? 
        format.html { redirect_to :back,  notice: 'You must have at least one passenger' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      elsif @booking.save 
        FlyMail.booking_confirmed(this_user).deliver if current_user
        format.html { redirect_to '/booking_confirmed', notice: 'Flight Booked Successfuly.' }
        format.json { render :show, status: :created, location: @booking }
      end
    end
  end

  def user_profile
    user = current_user.id if current_user
     @booking = Booking.where(user_id: user).paginate(:page => params[:page], :per_page => 5)
  end

  # def get_code
  #   @booking = Booking.where(new_booking_params[:code])
  #   #  respond_to do |format|
  #   #   if booking_params[:passengers_attributes].nil? 
  #   #     format.html { redirect_to :back }
  #   #     format.json { render json: @booking.errors, status: :unprocessable_entity }
  #   #     format.js {}
  #   #   elsif @booking.save 
  #   #     FlyMail.booking_confirmed(this_user).deliver if current_user
  #   #     format.html {  }
  #   #     format.json { render :show, status: :created, location: @booking }
  #   #     format.js {}
  #   #   end
  #   # end
  # end

 	private
	  def set_bookings
	    @booking = Booking.find(params[:id])
	  end

	  def booking_params
      params.require(:booking).permit(:flight_id, :user_id, :no_of_passengers, :code, 
        passengers_attributes:[:name, :email,:_destroy])
    end

    def new_booking_params
      params.permit(:flight_id, :code)
    end

    def this_user
      current_user if current_user
    end

   
end