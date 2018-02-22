class RoutesController < ApplicationController
	load_and_authorize_resource
	def index
	  binding.pry
	end
	def show
		@route=Route.find_by(id: params[:id])
	end
	def new
		@user=User.find_by(id: 1)
		@route=Route.new
	
	end
	def edit
		@route=Route.find_by(id: params[:id])
	end
	def update
		@route=Route.find_by(id: params[:id])
		raise params.inspect
		@route.number=params[:route][:number]
		params[:route][:stop_ids].each do |stop_id|
			if stop_id.to_i>0
			stop=Stop.find_by(id: stop_id.to_i)
			@route.stops<<stop
		end
	   end
		@route.save
		redirect_to routes_path 
	end
	def create
		binding.pry 
		@route=Route.new
		@route.number=params[:route][:number]
		params[:route][:stop_ids].each do |stop_id|
			if stop_id.to_i>0
			stop=Stop.find_by(id: stop_id.to_i)
			@route.stops<<stop
		end
		end
		@route.save
	    redirect_to routes_path 
	end


	def route_params(*args)
	 	params.permit(*args)
	 end

end
