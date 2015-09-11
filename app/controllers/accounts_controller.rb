class AccountsController < ApplicationController
	before_action :authenticate_user!

  	# before_action :require_permission!

	def show
		@account = current_user.account
	end
end