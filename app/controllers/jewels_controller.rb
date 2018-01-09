class JewelsController < ApplicationController
    before_action :set_jewel, only: [:edit, :show]

	def home
		@jewel = jewel.new
	end

	def index
		@jewels = current_user.jewels
	end

	def new
		@jewel = Jewel.new
	end

  def create
		@jewel = Jewel.new(body: params[:body], jot_id: params[:jot_id])
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



  private 

  def set_jewel
    @jewel = jewel.find(params[:id])
  end
end
