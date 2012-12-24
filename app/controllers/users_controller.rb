class UsersController < ApplicationController
	def postsignup
		if current_user.set_up?
			redirect_to '/'
		end
	end
end
