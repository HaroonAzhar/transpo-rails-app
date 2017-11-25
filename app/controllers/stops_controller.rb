class StopsController < ApplicationController
	def new
		@stop=Stop.new
	    
	end

	def create

		#without nested resources
		stop= Stop.new(stop_params(:name,:number,:details))
		stop.save
	
	

       redirect_to stops_path

		
	end
	def edit
		@stop=Stop.find_by(id: params[:id])
	end

	def update
		@stop = Stop.find(params[:id])
	    @stop.update(stop_params(:name,:number,:details))
		@stop.save	
	end

	def show
		@stop=Stop.find_by(id: params[:id])
	end

	 def stop_params(*args)
	 	params.require(:stop).permit(*args)
		
	end

end
