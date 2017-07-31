class Cp::CatsController < ApplicationController
	before_action :authenticate_user!
	before_action do 
    	redirect_to "/" unless current_user && current_user.admin?
  	end
	def edit
		@cat = Cat.find(params[:id])
	end
	def update
		@cat = Cat.find(params[:id])
		if @cat.update(cat_params)
			redirect_to "/cp/subcats"
		else 
			redirect_to "/cp/subcats"
		end
	end
	private
	def cat_params
		params.require(:cat).permit(:description)
	end
end
