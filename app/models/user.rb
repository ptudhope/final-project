# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :follow_requests, :foreign_key => "sender_id", :dependent => :destroy
  has_many :received_requests, :class_name => "FollowRequest", :foreign_key => "recipient_id", :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
  has_many :followers, :through => :follow_requests, :source => :recipient
  has_many :following, :through => :received_requests, :source => :sender
  
end
