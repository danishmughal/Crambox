class UsersController < ApplicationController
	def postsignup
		if current_user.set_up?
			redirect_to '/'
		end

		
	end

	def postsignup2 
		@year = params[:year]
		@semester = params[:semester]

		
	end
end
