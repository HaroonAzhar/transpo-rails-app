class RoutesController < ApplicationController

	def index
		
	end
	def show
		@route=Route.find_by(id: params[:id])
	end
	def new
		@route=Route.new
	end
	def edit
		@route=Route.find_by(id: params[:id])
	end
	def update
		@route=Route.find_by(id: params[:id])
		@route.update(route_params(:number))
		params[:route][:stop_ids].each do |stop_id|
			if stop_id.to_i>0
			stop=Stop.find_by(id: stop_id.to_i)
			@route.stops<<stop
		end
	   end
		@route.save
		binding.pry
	end
	def create
		@route=Route.new(route_params(:number))
		params[:route][:stop_ids].each do |stop_id|
			if stop_id.to_i>0
			stop=Stop.find_by(id: stop_id.to_i)
			@route.stops<<stop
		end
		end
		@route.save
		binding.pry
	end


	def route_params(*args)
		params.permit(*args)
	end

end
