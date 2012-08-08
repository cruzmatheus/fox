class Answer < ActiveRecord::Base
  attr_accessible :body, :correct
  
  belongs_to :question
end
