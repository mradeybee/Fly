class FlightsController < ApplicationController
	
	def index
  end
	
	def search
		parameter = params[:flight]
		@search = Flight.search(parameter[:origin_id], parameter[:destination_id])
		render 'pages/index' 
	end

  def flight_search
    parameter = params[:flight]
    if parameter[:origin] == parameter[:destination]
     redirect notice: "I am sure you dont want to fly to where you are"
    else
      @flight = Flight.search(parameter[:origin_id], parameter[:destination_id])
      render 'flights/_search_result'
    end    
  end

	private
    def search_params
      params.require(:flight).permit(:origin, :destination, :departure_date, :no_of_passenegers, 
      	:flight_attributes[:origin_id, :destination_id, :departure_date, :no_of_passenegers])
    end

  
end
