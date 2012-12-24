class CreateEnrolledCourses < ActiveRecord::Migration
  def change
	create_table :enrolled_courses do |t|
		t.string :subjectcode
		t.integer :classcode
		t.integer :schedule_id

	  t.timestamps
	end
  end
end
