class PaymentForm < ApplicationRecord
	belongs_to :user
	belongs_to :subcat
	belongs_to :state
end
