class Cp::SubcatsController < ApplicationController
	before_action :authenticate_user!
	before_action do 
    	redirect_to "/" unless current_user && current_user.admin?
  	end
	def index
		@cats = Cat.order("created_at ASC")
	end
	def show
		@subcat = Subcat.find(params[:id])
	end
	def new
		@subcat = Subcat.new
	end
	def create
		@subcat = Subcat.new(subcat_params)
		if @subcat.save
			redirect_to cp_subcats_path
		end
	end
	def edit
		@subcat = Subcat.find(params[:id])
	end
	def update
		@subcat = Subcat.find(params[:id])
		if @subcat.update(subcat_params)
			redirect_to cp_subcats_path
		end
	end
	def destroy
		@subcat = Subcat.find(params[:id])
		@subcat.destroy
		redirect_to cp_subcats_path
	end
	private
	def subcat_params
		params.require(:subcat).permit(:id ,:cat_id, :title, :description)
	end
end
