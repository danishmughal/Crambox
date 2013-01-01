class SchedulesController < ApplicationController
	def new
		@schedule = Schedule.new
		2.times { @schedule.enrolled_courses.build }
	end

	def create
		year = params[:schedule][:year]
		semester = params[:schedule][:semester]
		user_id = current_user.id


		@schedule = Schedule.new(params[:schedule])
		@schedule.user_id = user_id
		@schedule.save

		if !current_user.set_up?
			user = User.find(current_user.id)
			user.set_up = true
			user.save
		else
			flash[:success] = "#{year} + #{semester} + #{user_id} Schedule created"
			redirect_to @schedule
		end

	end



	def show
		@schedule = Schedule.find(params[:id])
	end


	def destroy
		Schedule.find(params[:id]).destroy
		flash[:success] = "The schedule has been deleted. All associated classes have been removed."
		redirect_to '/about'
	end
end
