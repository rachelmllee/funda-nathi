# == Schema Information
#
# Table name: chat_messages
#
#  id         :integer          not null, primary key
#  creator_id :integer
#  body       :string
#  chat_id    :integer
#  is_read    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChatMessage < ActiveRecord::Base

  belongs_to :chat

  validates :chat_id, presence: true

end
