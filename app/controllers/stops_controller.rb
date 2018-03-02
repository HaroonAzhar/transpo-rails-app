class StopsController < ApplicationController
	 load_and_authorize_resource

	def new
		@stop=Stop.new
	end

	def create
		@stop=Stop.new(stop_params(params))
		if @stop.valid?
		  @stop.save
	   else
	   	render :edit and return
	   end
	    redirect_to route_stops_path(@stop.route)
   end

	def edit
		@stop=Stop.find_by(id: params[:id])
	end

	def update
		 @stop=Stop.find_by(id: params[:id])
		 @stop.update(stop_params(params))
		 if @stop.valid?
		  @stop.save
	   else
	   	render :edit and return
	   end
		redirect_to route_stops_path(@stop.route)
	end

	def show
		@stop=Stop.find_by(id: params[:id])
	end

	def destroy
    Stop.find(params[:id]).destroy
    redirect_to routes_path
    end

	 def stop_params(*args)
	 	params.require(:stop).permit(:number, :name, :details, :route_id)
	end

end
