class HomeController < ApplicationController
 
 
  def index
  @userID = User.user_id
  end

end