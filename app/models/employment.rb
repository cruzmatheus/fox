class Employment < ActiveRecord::Base
  attr_accessible :organization_id, :user_id
  
  belongs_to :users
  belongs_to :organizations
end
