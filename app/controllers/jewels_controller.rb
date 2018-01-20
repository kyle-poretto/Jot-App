class JewelsController < ApplicationController
    before_action :set_jewel, only: [:edit, :show]

	def home
		@jot = Jot.new
		@jewel = Jewel.new
	end

	def index
		@jewels = current_user.jewels
	end

  def new
    @user = User.find(params[:user_id])
    @jot = @user.jots.last
    @jewel = @user.jewels.build
	end

  def create
		@jewel = Jewel.new(body: params[:jewel][:body], jot_id: params[:jewel][:jot_id])
		@jot = Jot.find(params[:jewel][:jot_id])
		if @jewel.save
			redirect_to user_jewel_path(current_user, @jewel)
		else
			redirect_to new_jewel_path 
		end
	end
	
	def show

	end

	def edit
		@user = User.find(params[:user_id])
	end

  def update
		@jewel = Jewel.find(params[:jewel][:id])
		@jot = Jot.find(params[:jewel][:jot_id])
		redirect_to jot_jewel_path([@jot, @jewel])
	end

	private 
	
	def jewel_params
		params.require(:jewel).permit(:id, :body, :jot_id)
	end

	def set_jewel
    @jewel = Jewel.find(params[:id])
  end
end
