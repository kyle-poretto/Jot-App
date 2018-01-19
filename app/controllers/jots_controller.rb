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
		@jot = Jot.new
	end

	def create
		@jot = Jot.new(title: params[:jot][:title], body: params[:jot][:body], user_id: params[:jot][:user_id])
		if @jot.save
			redirect_to jot_path(@jot)
		else
			redirect_to new_jot_path(@jot)
		end
	end
	
	def show
		if @jot.jewel
			@jewel = @jot.jewel
		else
			@jewel = @jot.build_jewel
		end 
	end

	def edit
		
	end

	def update
		@jot = Jot.update(title: params[:jot][:title], user_id: params[:jot][:user_id], body: params[:jot][:body])	
		redirect_to jot_path(@jot)
	end



  private 
  
  def jot_parameters
		params.permit(:jot).require(:jot_id, :title, :body, :user_id)
  end

  def set_jot
    @jot = Jot.find(params[:id])
  end

end
