# == Schema Information
#
# Table name: follow_requests
#
#  id           :integer          not null, primary key
#  status       :string
#  recipient_id :integer
#  sender_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FollowRequest < ApplicationRecord
    belongs_to :sender, :class_name => "User"
    belongs_to :recipient, :class_name => "User"
end
