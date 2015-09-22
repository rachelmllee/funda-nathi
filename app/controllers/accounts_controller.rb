class AccountsController < ApplicationController
	before_action :authenticate_user!

<<<<<<< HEAD
=======
  	# before_action :require_permission!
>>>>>>> cdab4e810dd6dc61f8667973191e9cf1c564fe10

	def show
		@account = current_user.account
		unless @account
			@account = Account.create(user_id: current_user.id, credit: 0, subcription: 0)			
		end
	end
<<<<<<< HEAD

	def payment
		@account =Account.find(params[:id])
		@id = current_user.user_id
	end
	
	private 
	
	def acc_params
		params.require(:acount).permit(:name, :email, :reference, :credit)
	end 

=======
>>>>>>> cdab4e810dd6dc61f8667973191e9cf1c564fe10
end