class JotsController < ApplicationController
	before_action :set_jot, only: [:edit, :show]

	def home
		if current_user.member_signed_in?
			@jot = Jot.new
			@followers = current_user.following
			@user = current_user
		else 
			redirect_to not_signed_in_home_path
		end
	end

	def index
		@user = User.find(params[:user_id])
		@jots = @user.jots
	end

	def new
		@user = User.find(params[:user_id])
		@jot = @user.jots.build
	end

	def create
		@user = User.find(params[:user_id])
		@jot = Jot.new(title: params[:jot][:title], body: params[:jot][:body], user_id: params[:jot][:user_id])
		if @jot.save
			redirect_to user_jot_path(current_user, @jot)
		else
			render 'jots/new'
		end
	end
	
	def show
		@user = User.find(params[:user_id])
    @jot = @user.jots.find(params[:id])
    @jewel = @user.jewels.build
	end

	def edit
		@user = User.find(params[:user_id])
	end

	def update
		@jot = Jot.update(title: params[:jot][:title], user_id: params[:jot][:user_id], body: params[:jot][:body])	
		redirect_to user_jot_path(current_user, @jot)
	end

  private 
  
  def jot_parameters
		params.permit(:jot).require(:jot_id, :title, :body, :user_id)
  end

  def set_jot
    @jot = Jot.find(params[:id])
  end

end
