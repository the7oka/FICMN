class Cp::ContactsController < ApplicationController
	before_action :authenticate_user!
	before_action do 
    	redirect_to "/" unless current_user && current_user.admin?
  	end
	def index
		@queries = Query.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
	end
	def edit
		@query = Query.find(params[:id])
		@subcats = @query.subcat.cat.subcats
		@cat = @query.subcat.cat
	end
	def update
		@query = Query.find(params[:id])
		if @query.update(query_params)
			redirect_to '/cp/contacts'
		end
	end
	def delete 
		@query = Query.find(params[:id])
		@query.destroy
		redirect_to "/cp/contacts"
	end
	private
	def query_params
		params.require(:query).permit(:subcat_id, :state_id, :first_name, :middle_name, :last_name, :address_one, :address_two, :state, :city, :zip, :phone, :email, :birth, :status, :details)
	end
end
