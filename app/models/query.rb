class Query < ApplicationRecord
	belongs_to :user
	belongs_to :subcat
	belongs_to :state
	has_one :invoice
	STATUS_TYPES = ["Single", "Married", "Widow", "Widower", "Divorced"]
end
