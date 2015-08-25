# == Schema Information
#
# Table name: webinars
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  chat_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Webinar < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat
end
