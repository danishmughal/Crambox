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

	def show
		@user = User.find(params[:id])
		@image = @user.image.sub 'square', 'large'
		@schedule = Schedule.where("user_id = ?", @user.id).first
		@classes = EnrolledCourse.where("schedule_id = ?", @schedule.id)
	end
end
