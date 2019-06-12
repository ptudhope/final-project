# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  address    :string
#  cuisine    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Restaurant < ApplicationRecord
    has_many :likes, :dependent => :destroy
    has_many :comments, :dependent => :destroy
end
