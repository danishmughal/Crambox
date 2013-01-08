class SchedulesController < ApplicationController
	require 'nokogiri'
	require 'open-uri'

	def new
		@schedule = Schedule.new
		2.times { @schedule.enrolled_courses.build }


		#Creates the @yearlist array to populate the year dropdown.
		@yeardoc = Nokogiri::XML(open("http://courses-test.illinois.edu/cisapp/explorer/catalog.xml"))
		years = @yeardoc.xpath("//calendarYear/text()")
		@yearlist = Array.new
		years.each do |output|
			@yearlist.push output
		end

		#Creates the @semesterlist array to populate the semester dropdown
		@semesterlist = Array.new
		@semesterlist.push "Spring"
		@semesterlist.push "Fall"
		@semesterlist.push "Summer"

		#Creates the @subjectlist
		@subjectdoc = Nokogiri::XML(open("http://courses-test.illinois.edu/cisapp/explorer/catalog/2013/spring.xml"))
		subjects = @subjectdoc.xpath("//subject/@id")
		@subjectlist = Array.new
		subjects.each do |output|
			@subjectlist.push output
		end


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
			redirect_to '/'
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
