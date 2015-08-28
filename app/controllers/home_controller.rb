class HomeController < ApplicationController
  def index
  @userID = current_user.user_id
  @user =current_user.signed_in?
  end

end