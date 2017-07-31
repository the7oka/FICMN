class Cp::PostsController < ApplicationController
	before_action :authenticate_user!
	before_action do 
    	redirect_to "/" unless current_user && current_user.admin?
  	end
	def index
		@posts = Post.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
	end
	def show
		@post = Post.find(params[:id])
	end
	def new
		@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to cp_posts_path
		end
	end
	def edit
		@post = Post.find(params[:id])
	end
	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to cp_posts_path
		end
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to cp_posts_path
	end
	private
	def post_params
		params.require(:post).permit(:title, :content)
	end

end
