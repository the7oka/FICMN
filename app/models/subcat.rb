class Subcat < ApplicationRecord
	belongs_to :cat
	has_many :queries
	has_many :orders
	has_many :contactmes
end
