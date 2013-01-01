class EnrolledCoursesController < ApplicationController
	def new
		@enrolled_course = EnrolledCourse.new
	end

	def create
	    @enrolled_course = EnrolledCourse.new(params[:enrolled_course])
	end


=begin
	def initialsetup
		subjectcode = params[:enrolled_course][:subjectcode]
		classcode = params[:enrolled_course][:classcode]
		scheduleid = params[:enrolled_course][:schedule_id]

		@year = params[:year]
		@semester = params[:semester]

		#EnrolledCourse.create(subjectcode: subjectcode, classcode: classcode, schedule_id: scheduleid)

		#schedule = Schedule.where("user_id = ? AND semester = ? AND year = ?", current_user.id, semester, year)
		#if schedule.nil?
		#	Schedule.create(user_id: current_user.id, semester: semester, year: year)
		#end


		flash[:success] = "Added course: #{subjectcode} #{classcode} #{scheduleid} to your schedule."
		redirect_to '/postsignup2'

		@enrolled_course = EnrolledCourse.new(subjectcode: subjectcode, classcode: classcode, schedule_id: scheduleid)

		if @enrolled_course.save
			flash[:success] = "Course added/created."
			redirect_to '/'
		else
			flash[:error] = "Failure. Please try again."
			render 'new'
		end
=end
	


	end
end
