class LandingPageController < ApplicationController
  def home
  	@user = User.new
  end

end
