class Cp::PaymentFormsController < ApplicationController
	before_action :authenticate_user!
	before_action do 
    	redirect_to "/" unless current_user && current_user.admin?
  	end
	def edit
		@pf = PaymentForm.find(params[:id])
		@subcats = @pf.subcat.cat.subcats
		@cat = @pf.subcat.cat
	end
	def update
		@pf = PaymentForm.find(params[:id])
		if @pf.update(payment_form_params)
			redirect_to '/cp/payments'
		end
	end
	def delete 
		@pf = PaymentForm.find(params[:id])
		@pf.destroy
		redirect_to "/cp/payments"
	end
	private
	def payment_form_params
		params.require(:payment_form).permit(:business_name ,:subcat_id, :state_id, :first_name, :middle_name, :last_name, :address_one, :address_two, :state, :city, :zip, :phone, :email, :birth, :status, :details)
	end
end