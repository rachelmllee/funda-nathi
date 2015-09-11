class AccountsController < ApplicationController
	before_action :authenticate_user!

  	# before_action :require_permission!

	def show
		@account = current_user.account
		unless @account
			@account = Account.create(user_id: current_user.id, credit: 0, subcription: 0)			
		end
	end
end