class HomeController < ApplicationController
	def index
		@posts = Post.all.last(3)
	end
	def news
		@posts = Post.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
	end
	def onews
	end
	def careers
	end
	def services
		@cats = Cat.all
	end
	def our_services
		@cats = Cat.all
	end
	def cats
		@cat = Cat.where('title = ?', params[:id]).last
	end
	def subcats
		@subcat = Subcat.find(params[:id])
	end
	def about
	end
	def millionaire_club
		@page = Page.find(1)
	end
	def business_start_ups
		@page = Page.find(2)
	end
	def media_advertising
		@page = Page.find(3)
	end
	def business_evaluation
		@page = Page.find(4)
	end
	def women_and_money
		@page = Page.find(5)
	end
	def fic_community_outreach
		@page = Page.find(6)
	end
	def locations
	end
	def contact_us
		@contactme = Contactme.new
	end
	def create
		@contactme = Contactme.new(contactme_params)
		if @contactme.save
			QueryMailer.contactme_noty(@contactme).deliver
			redirect_to "/"
		end
	end
	private 
	def contactme_params
		params.require(:contactme).permit(:name , :phone, :email, :subcat_id , :details)
	end
end
