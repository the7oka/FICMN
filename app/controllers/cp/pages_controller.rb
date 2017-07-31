class Cp::PagesController < ApplicationController
	before_action :authenticate_user!
	before_action do 
    	redirect_to "/" unless current_user && current_user.admin?
  	end
	def index 
		@pages = Page.all
	end
	def edit
		@page = Page.find(params[:id])
	end
	def update
		@page = Page.find(params[:id])
		if @page.update(page_params)
			redirect_to "/cp/pages"
		end
	end
	private 
	def page_params
		params.require(:page).permit(:text1, :text2, :head)
	end
end
