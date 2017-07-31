class Cp::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action do 
    	redirect_to "/" unless current_user && current_user.admin?
  	end
	def index
		@users = User.all
	end
	def statistics
		@users = User.all
		@queries = Query.all
		@invoices = Invoice.all
		@posts = Post.all
	end
end
