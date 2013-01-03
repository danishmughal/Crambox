class EnrolledCoursesController < ApplicationController
	def new
		@enrolled_course = EnrolledCourse.new
	end

	def create
	    @enrolled_course = EnrolledCourse.new(params[:enrolled_course])
	end

end
