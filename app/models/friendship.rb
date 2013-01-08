# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  user_2     :integer
#  accepted   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendship < ActiveRecord::Base
  attr_accessible :user_id, :user_2, :accepted

  belongs_to :owner, :class_name => "User"
  belongs_to :user



end
