class Cp::ContactmesController < ApplicationController
	before_action :authenticate_user!
	before_action do 
    	redirect_to "/" unless current_user && current_user.admin?
  	end
	def index
		@contactmes = Contactme.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
	end
	def delete 
		@contactme = Contactme.find(params[:id])
		@contactme.destroy
		redirect_to "/cp/contactmes"
	end
end
