class RoutesController < ApplicationController
	load_and_authorize_resource
	

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
		@route.number=params[:route][:number]
		params[:route][:stop_ids].each do |stop_id|
			if stop_id.to_i>0
			stop=Stop.find_by(id: stop_id.to_i)
			@route.stops<<stop
		end
	   end
	   if @route.valid?
		@route.save
	   else
	   	render :edit and return
	   end
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
		if @route.valid?
		@route.save
	   else
	   	render :new and return
	   end
	    redirect_to routes_path 
	end
	def destroy
    Route.find(params[:id]).destroy
    redirect_to routes_path
     end


	def route_params(*args)
	 	params.require(:route).permit(:number, :stop_ids)
	 end

end
