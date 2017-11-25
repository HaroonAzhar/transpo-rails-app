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
		puts "update"
		raise params.inspect
	end
	def create
		puts "create"
		raise params.inspect
	end


	def route_params(*args)
		params.require(:stop).permit(*args)
	end

end
