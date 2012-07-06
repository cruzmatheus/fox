class User < ActiveRecord::Base
  attr_accessible :email, :name, :photo, :active
  
  has_many :employments
  has_many :organizations, :though => :employments
end
