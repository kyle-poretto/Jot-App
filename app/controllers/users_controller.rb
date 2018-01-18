class UsersController < ApplicationController

    def home
      
    end
    
    def followers
      @followers = current_user.followers
      @user = current_user
    end

    def show
			@user = User.find(params[:id])
    end
    
    def following
      @user = User.find(params[:id])
      @followed_users = @user.following
    end

		
		def edit
			
		end
end