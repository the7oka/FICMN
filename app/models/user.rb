class User < ApplicationRecord
	has_many :queries
	has_many :orders
	has_many :payment_forms
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
	def self.from_omniauth(auth)
	  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    	if auth.provider == "facebook"
		  		user.email = auth.info.email
				user.skip_confirmation!
			else 
				user.email = auth.info.email
				user.skip_confirmation!
	  		end
	  	end
	end
	def password_required?
  		super && provider.blank?
	end
	def email_required?
  		super && provider.blank?
	end
end
