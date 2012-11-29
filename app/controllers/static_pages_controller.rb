class StaticPagesController < ApplicationController

	def home
		if current_user
			if !current_user.set_up
				redirect_to "/postsignup"
			end
		end
	end

	def about
	end

	def contact
	end
end
