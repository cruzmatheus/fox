class Organization < ActiveRecord::Base
  attr_accessible :city, :name, :photo, :uf
  
  has_many :employments
  has_many :users, :through => :employments
end
