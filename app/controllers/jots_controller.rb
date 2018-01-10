class JotsController < ApplicationController
	before_action :set_jot, only: [:edit, :show]

	def home
		@jot = Jot.new
		@jots = current_user.followers.jots
	end

	def index
		@jots = current_user.jots
	end

	def new
		@jot = Jot.new
	end

	def create
		@jot = Jot.new(title: params[:jot][:title], body: params[:jot][:body], user_id: params[:jot][:user_id])
		if @jot.save
			flash[:notice] = "Jot Submitted, Your Legacy Will Live On"
			redirect_to jot_path(@jot)
		else
			redirect_to new_jot_path 
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
		#"jot"=>{"title"=>"THe best title for my jot", "user_id"=>"5", "body"=>"the jot of teh millenia"},
		@jot = Jot.update(title: params[:jot][:title], user_id: params[:jot][:user_id], body: params[:jot][:body])	
		redirect_to jot_path(@jot)
	end



  private 

  def set_jot
    @jot = Jot.find(params[:id])
  end

end
