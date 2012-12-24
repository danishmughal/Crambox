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

require 'test_helper'

class EnrolledCourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
