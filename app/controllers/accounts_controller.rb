class AccountsController < ApplicationController
	before_action :authenticate_user!


	def show
		@account = current_user.account
		unless @account
			@account = Account.create(user_id: current_user.id, credit: 0, subcription: 0)			
		end
	end
end