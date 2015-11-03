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
    @flight = Flight.search(parameter[:origin_id], parameter[:destination_id])
    render 'flights/_search_result'    
  end

	private
    def search_params
      params.require(:flight).permit(:origin, :destination, :departure_date, :flight_attributes[:origin_id, :destination_id, :departure_date])
    end
end
