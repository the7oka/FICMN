class Invoice < ApplicationRecord
	belongs_to :query
	has_one :order
end
