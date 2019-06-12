# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  address    :string
#  cuisine    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ApplicationRecord
    has_many :likes, :dependent => :destroy
    has_many :comments, :dependent => :destroy
end
