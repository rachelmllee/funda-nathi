class HomeController < ApplicationController
  def index
  @userId = current_user.user_id
  end

end