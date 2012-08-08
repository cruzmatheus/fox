class Question < ActiveRecord::Base
  attr_accessible :enunciation, :objective, :answers_attributes
  
  has_many :answers
  accepts_nested_attributes_for :answers
end
