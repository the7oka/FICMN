class PaymentFormsController < ApplicationController
	before_action :authenticate_user!
	def new
			@payment_form = PaymentForm.new
	end
	def create
		@payment_form = current_user.payment_forms.build(payment_form_params)
		if @payment_form.save
			PaymentMailer.payment_form_notification(@payment_form).deliver
			redirect_to '/submit_payment/'+@payment_form.id.to_s+'/'+current_user.id.to_s
		end
	end
	def submit_payment
		@payment_form = PaymentForm.find(params[:id])
		@user = User.find(params[:id2])
		if @user != current_user || @payment_form.user != current_user
			redirect_to "/"
		end
	end
	private
	def payment_form_params
		params.require(:payment_form).permit(:business_name ,:subcat_id, :state_id, :first_name, :middle_name, :last_name, :address_one, :address_two, :state, :city, :zip, :phone, :email, :birth, :status, :details)
	end
end
