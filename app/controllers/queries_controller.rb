class QueriesController < ApplicationController
	before_action :authenticate_user!,except: 'new'
	def new
			@cat = Cat.where('title = ?', params[:subcat]).last
			@subcats = @cat.subcats.order('title ASC')
		if user_signed_in?
			@query = Query.new
		else
			redirect_to "/users/sign_up"
		end
	end
	def create
		@query = current_user.queries.build(query_params)
		if @query.save
			QueryMailer.admin_notification(@query).deliver
      		QueryMailer.customer_notification(@query).deliver
			redirect_to '/myqueries'
		end
	end
	def getsubcat
		@subcat = Subcat.find(params[:id])
		render :json => @subcat
	end
	def myhistory
		@user = current_user
	end
	def myqueries
		@user = current_user
		@queries = @user.queries
		@invoices = Invoice.where(query_id: @queries.pluck(:id))
		@invoices = @invoices.where('paid = ?', false)
		@dp = @user.orders.where('invoice_id IS NULL')
		@ot = OrderTransaction.where(order_id: @dp.pluck(:id))
		@paiddp = @ot.where('success = ?', true)
	end
	def myinvoices
		@user = current_user
		@queries = @user.queries
		@invoices = Invoice.where(query_id: @queries.pluck(:id))
	end
	def pending_invoices
		@user = current_user
		@queries = @user.queries
		@invoices = Invoice.where(query_id: @queries.pluck(:id))
		@invoices = @invoices.where('paid = ?', false)
	end
	def edit
		@query = Query.find(params[:id])
		if @query.user == current_user
			@subcats = @query.subcat.cat.subcats
			@cat = @query.subcat.cat
			render 'new'
		else
			redirect_to '/'
		end
	end
	def update
		@query = Query.find(params[:id])
		if @query.user == current_user
			if @query.update(query_params)
				redirect_to '/myqueries'
			end
		end
	end
	private
	def query_params
		params.require(:query).permit(:business_name ,:subcat_id, :state_id, :first_name, :middle_name, :last_name, :address_one, :address_two, :state, :city, :zip, :phone, :email, :birth, :status, :details)
	end
end
