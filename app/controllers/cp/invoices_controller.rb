class Cp::InvoicesController < ApplicationController
	before_action :authenticate_user!
	before_action do 
    	redirect_to "/" unless current_user && current_user.admin?
  	end
	def new
		@query = Query.find(params[:id])
		@invoice = Invoice.new
	end
	def show
		@query = Query.find(params[:id])
	end
	def show_payment
		@ot = OrderTransaction.find(params[:id])
	end
	def create 
		@invoice = Invoice.new(invoice_params)
		if @invoice.save
			redirect_to '/cp'
		end
	end
	def index
		@pfs = PaymentForm.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
		@invoices = Invoice.all
		@soorders = Order.where('invoice_id IS NULL')
		@soto = OrderTransaction.where(order_id: @soorders.pluck(:id))
		@paid = @soto.where("success = ?", true)
		@unpaid = @soto.where("success = ?", false)
	end
	private
	def invoice_params
		params.require(:invoice).permit(:amount, :details, :query_id)
	end
end
