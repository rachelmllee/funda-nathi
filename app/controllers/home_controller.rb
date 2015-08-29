class HomeController < ApplicationController
  def index
  @userID = current_user.user_id
  end

end