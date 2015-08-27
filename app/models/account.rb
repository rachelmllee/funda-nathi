class Account < ActiveRecord::Base
  SPECIAL  = 1
  PREMIUM  = 2
  STANDARD = 3

  belongs_to :user

  validates :subcription, :inclusion => { in: [SPECIAL, PREMIUM, STANDARD] }
end
