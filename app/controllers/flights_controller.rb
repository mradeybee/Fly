class FlightsController < ApplicationController
	
	def index
 
    respond_to do |format|
      format.html{render 'flights/index' } 
      format.json { render :show, status: :created, location: @flight }
      format.js {}
    end
  end
	
	def search
		parameter = params[:flight]
		@search = Flight.search(parameter[:origin_id], parameter[:destination_id], parameter[:departure_date].gsub("/", "-"))
    respond_to do |format|
      if !@search.empty?
        format.html{render 'pages/index' }
        format.json { render :show, status: :created, location: @search }
        format.js {}
      else
        format.html { render :index }
        format.json { render json: @search.errors, status: :unprocessable_entity }
        format.js {}
      end
    end    
  	end

  def flight_search
    parameter = params[:flight]
    @flight = Flight.search(parameter[:origin_id], parameter[:destination_id])
    respond_to do |format|
      if !@flight.empty?
        format.html{ render 'flights/_search_result'}
        format.json { render :show, status: :created, location: @flight }
        format.js {}
      else
        format.html { render :index }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
        format.js {}
      end
    end    
  end

	private
    def search_params
      params.require(:flight).permit(:origin, :destination, :departure_date, :no_of_passenegers, 
      	:flight_attributes[:origin_id, :destination_id, :departure_date, :no_of_passenegers])
    end
end
