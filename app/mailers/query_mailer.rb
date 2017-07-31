class QueryMailer < ApplicationMailer
	def customer_notification(query)
		@query = query
		mail(to: @query.email, subject: 'Query submit Confirmation')
	end
	def admin_notification(query)
		@query = query
		mail(to: 'mah.mostafa@icloud.com', subject: 'Query received')
	end
	def contactme_noty(contactme)
		@contactme = contactme
		mail(to: 'al@ficmn.com, sk@ficmn.com, Insurance@ficmn.com, tax@ficmn.com', subject: 'Contact us notification')
	end
end
