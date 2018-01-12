class UsersController < ApplicationController

    def home
      
    end
    
    def followers
      @jots = current_user.followers
    end

    def show
			@user = current_user
		end
		
		def edit
			
		end
end