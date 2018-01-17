class UsersController < ApplicationController

    def home
      
    end
    
    def followers
      @jots = current_user.followers
    end

    def show
			@user = User.find(params[:id])
    end
    
    def following
      @user = User.find(params[:id])
    end
		
		def edit
			
		end
end