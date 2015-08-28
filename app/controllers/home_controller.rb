class HomeController < ApplicationController
  def index
    @ID = current_user.user_id
  end

end