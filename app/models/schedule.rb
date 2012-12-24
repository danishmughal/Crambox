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

class Schedule < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :enrolled_courses
  belongs_to :user
  attr_accessible :user_id, :semester, :year
end
