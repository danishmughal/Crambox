# == Schema Information
#
# Table name: enrolled_courses
#
#  id          :integer          not null, primary key
#  subjectcode :string(255)
#  classcode   :integer
#  schedule_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class EnrolledCourse < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :schedule

  attr_accessible :subjectcode, :classcode, :schedule_id

end
