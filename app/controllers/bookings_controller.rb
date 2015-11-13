class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @booking = Booking.new(new_booking_params)
    @booking.user_id = current_user.id if current_user
  end

  def edit
    if !current_user
      redirect_to root_path 
    else
      @passengers = Passenger.where(booking_id: params[:id])
      @booking = Booking.find(params[:id])
      @flight = Flight.find(@booking.flight_id)
      @origin = Airport.where(id: @flight.origin_id)
      @destination = Airport.where(id: @flight.destination_id)
    end
  end

  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if booking_params[:passengers_attributes].nil?
        format.html { redirect_to :back,  notice: 'You must have at least one passenger' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      elsif @booking.save 
        FlyMail.booking_confirmed(this_user, @booking).deliver if current_user
        format.html { redirect_to booking_confirmed_path(@booking.id), notice: 'Flight Booked Successfuly.' }
        format.json { render :show, status: :created, location: @booking }
      end
    end
  end

  def update
    respond_to do |format|
      if booking_params[:passengers_attributes].include?(:_destroy => 1)
        format.html { redirect_to :back,  notice: 'You must have at least one passenger' }
        format.json { render json: @booking.errors, status: :unprocessable_entity } 
      elsif  @booking.update(booking_params)
        format.html { redirect_to :back, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully Canceled.' }
      format.json { head :no_content }
    end
  end

  def user_profile
    if !current_user
      redirect_to root_path 
    else
      user = current_user.id if current_user
      @booking = Booking.where(user_id: user).paginate(:page => params[:page], :per_page => 5)
    end
  end

  def booking_confirmed
    @booking = Booking.find(params[:id])
  end

  def get_code
    @booking = Booking.where(code: params[:code])
  end

  private
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:flight_id, :user_id, :code, 
      passengers_attributes:[:id,:name, :email,:_destroy])
  end

  def new_booking_params
    params.permit(:flight_id)
  end

  def this_user
    current_user if current_user
  end   
end