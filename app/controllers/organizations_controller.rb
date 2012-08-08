class OrganizationsController < ApplicationController

  def new
    @org = Organization.new
  end

end
