class StopsController < ApplicationController
	 load_and_authorize_resource
	def new
		@stop=Stop.new
		binding.pry
		
		@route=Route.find_by(id: params[:route_id])
	
	    
	end

	def create
		
		if params[:route_id]
			@route=Route.find_by(id: params[:route_id])
			@stop= Stop.new(stop_params(:name,:number,:details))
			@stop.route=@route 
			@stop.save!
			
			
		else
			#throw error
		
		end

	

       redirect_to stops_path

		
	end

	def edit
		
		@route=Route.find_by(id: params[:route_id])
		@stop=Stop.find_by(id: params[:id])
	end

	def update
		if params[:route_id]
			@route=Route.find_by(id: params[:route_id])
			@stop = Stop.find(params[:id])
	    	@stop.update(stop_params(:name,:number,:details))
			@stop.route=@route 
			@stop.save!
			
		else
		#throwerror
		end
	end

	def show
		@stop=Stop.find_by(id: params[:id])
	end

	 def stop_params(*args)
	 	params.require(:stop).permit(*args)
		
	end

end
