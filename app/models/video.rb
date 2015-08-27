# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  length      :string
#  course_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  url         :string
#

class Video < ActiveRecord::Base
  belongs_to :course

  validates :title, :url, presence: true
end
