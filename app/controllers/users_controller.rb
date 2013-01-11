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
		if @user.image
			@image = @user.image.sub 'square', 'large'
		end
		@schedule = Schedule.where("user_id = ?", @user.id).first
		@classes = EnrolledCourse.where("schedule_id = ?", @schedule.id)
	end


	#loads the page where users in the current_user's classes are displayed in a list
	#really messy code. sorry.
	def schedulematch

		#This is the hash which will hold the `user_id` and `number of classes in common` of other users
		#as compared to the current_user
		#key => user_id
		#value => number of classes in common
		@match = Hash.new
		@matchclass = []

		@user = User.find(current_user.id)
		@schedule = Schedule.where("user_id = ?", @user.id).first
		@classes = EnrolledCourse.where("schedule_id = ?", @schedule.id)		

		#Now that we have all the classes we must add the classes to the array
		@userclasses = []
		@classes.each do |c|
			classcomposite = c.subjectcode + c.classcode.to_s
			@userclasses.push(classcomposite)
		end

		#All off the classes that the current user is taking is now in @userclasses
		#Now we must compare the classes of other users to our current users' classes

		@otherusers = User.find(:all, :conditions => ["id != ?", current_user.id])

		@otherusers.each do |u|
			uschedule = Schedule.where("user_id = ?", u.id).first
			uclasses = EnrolledCourse.where("schedule_id = ?", uschedule.id)
			@otheruserclasses = [] #Array containing classes of the otheruser
			uclasses.each do |v|
				otherclasscomposite = v.subjectcode + v.classcode.to_s
				@otheruserclasses.push(otherclasscomposite)
			end

			#Finds the classes in common by doing an intersection between the collections
			commonclasses = @userclasses & @otheruserclasses


			if commonclasses.size > 0 
				@match[u.id] = commonclasses.size
				@matchclass[u.id] = commonclasses
			end
		end

		@matchinguserids = @match.keys
		@numberclasses = @match.values
		@match.sort_by {|_key, value| value}

		@matchingusers = []
		@matchinguserids.each do |u|
			finduser = User.find(u)
			@matchingusers.push(finduser)
		end
	end





	
end
