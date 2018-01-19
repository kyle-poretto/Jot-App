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
		@jewel = Jewel.new
	end

	def create
		@jewel = Jewel.new(body: params[:jewel][:body], jot_id: params[:jewel][:jot_id])
		if @jewel.save
			flash[:notice] = "jewel Submitted, Your Legacy Will Live On"
			redirect_to jewel_path(@jewel)
		else
			redirect_to new_jewel_path 
		end
	end
	
	def show

	end

	def edit
		
	end

	def update
		@jewel = Jewel.find(params[:jewel][:id])
		@jewel.body = params[:jewel][:body]
		redirect_to jewel_path(@jewel)
	end

	private 
	
	def jewel_params
		params.require(:jewel).permit(:id, :body, :jot_id)
	end

	def set_jewel
    @jewel = Jewel.find(params[:id])
  end
end
