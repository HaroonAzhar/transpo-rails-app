class StopsController < ApplicationController
	 load_and_authorize_resource
	def new
		@stop=Stop.new
		binding.pry
		
		
	
	    
	end

	def create
		@stop=Stop.new(stop_params(params))
		
		
			@stop.save!
			
			
		

	
		binding.pry
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
	 	params.require(:stop).permit(:number, :name, :details, :route_id)
	end

end
