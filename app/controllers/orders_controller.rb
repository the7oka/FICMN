class OrdersController < ApplicationController
	before_action :authenticate_user!
	def new
		@order = Order.new
		@invoice = Invoice.find(params[:id])
	end
	def create
		@invoice = Invoice.find(params[:id])
		@order = @invoice.build_order(order_params)
		@order.ip_address = request.remote_ip
		if @order.save
			if @order.purchase
				flash[:success] = 'Payment confirmed'
		  		redirect_to "/"
			else
		 		render :action => "failure"
			end
		else
			render :action => 'new'
		end
	end
	def payment
		@order = Order.new
	end
	def create_payment
		@order = Order.new(order_params)
		@order.ip_address = request.remote_ip
		if @order.save
			if @order.payup
				flash[:success] = 'Payment confirmed'
		  		redirect_to "/success/"+@order.id.to_s
			else
		 		render :action => "failure"
			end
		else
			puts @order.errors.full_messages
			render :action => 'payment'
		end
	end
	def success
		@order = Order.find(params[:id])
	end
	def failure
	end

	private
	def order_params
		params.require(:order).permit(:subcat_id ,:user_id, :business_name ,:first_name, :last_name, :card_type, :card_expires_on, :card_number, :card_verification, :express_token, :express_payer_id, :billing_address, :phone, :email, :billing_address_2, :city, :state, :country, :zipcode, :payment_amount)
	end
end
