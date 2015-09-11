class Account < ActiveRecord::Base
  SPECIAL = 1
  PREMIUM = 2
  STANDARD= 3

  belongs_to :user

  validates :subcription, :inclusion => { in: [SPECIAL, PREMIUM, STANDARD]}

  def get_subscription
  	case subcription
	when 1
		return 'SPECIAL'
	when 2
		return 'PREMIUM'
	when 3
		return 'STANDARD'
	end
  end
end
