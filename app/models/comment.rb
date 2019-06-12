# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  caption       :string
#  user_id       :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant
    
    def author
        return User.where({ :id => self.user_id})
    end
end
