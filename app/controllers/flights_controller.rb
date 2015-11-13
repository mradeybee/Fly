class FlightsController < ApplicationController
  
  def index
    respond_to do |format|
      format.html{render 'flights/index' } 
      format.json { render :show, status: :created, location: @flight }
      format.js {}
    end
  end

 def flight_search
    search("flights/_search_result")   
 end 

 def index_search
   search("pages/index")
 end

  private
  
  def search_params
    params.require(:flight).permit(:origin, :destination, :departure_date, :no_of_passenegers, 
      :flight_attributes[:origin_id, :destination_id, :departure_date, :no_of_passenegers])
  end

  def search(page)
    parameter = params[:flight]
    @flights = Flight.search(parameter[:origin_id], parameter[:destination_id])
    respond_to do |format|
      unless @flights.empty?
        format.json { render :show, status: :created, location: @flights }
        format.js {}
      else
        format.json { render json: @flights.errors, status: :unprocessable_entity }
        format.js {}
      end
    end    
  end
end
