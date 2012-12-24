# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  semester   :string(255)
#  year       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
