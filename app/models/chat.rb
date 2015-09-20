# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chat < ActiveRecord::Base
  has_many :webinars, :dependent => :destroy
  has_many :users, :through => :webinars

  has_many :chat_messages
end
