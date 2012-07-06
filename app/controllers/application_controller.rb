class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def get_all_invites
    @invites = Invite.all    
  end
  
end
