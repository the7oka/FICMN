class PaymentMailer < ApplicationMailer
	def customer_notification(order)
		@order = order
		mail(to: @order.email, subject: 'Payment Confirmation')
	end
	def admin_notification(order)
		@order = order
		mail(to: 'mah.mostafa@icloud.com', subject: 'Payment Received')
	end
	def customer_payment_notification(order)
		@order = order
		mail(to: @order.email, subject: 'Payment Confirmation')
	end
	def admin_payment_notification(order)
		@order = order
		mail(to: 'mah.mostafa@icloud.com', subject: 'Payment Received')
	end
	def payment_form_notification(payment_form)
		@payment_form = payment_form
		mail(to: 'al@ficmn.com, sk@ficmn.com, Insurance@ficmn.com, tax@ficmn.com', subject: 'Website Payment')
	end
end
