# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  category    :string
#  grade       :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ActiveRecord::Base
  belongs_to :user
  has_many :videos
  has_many :documents

  validates :name, :category, :grade, presence: true

  CATEGORIES = ['Accounting', 'Art', 'Biology', 'Business', 'Chemistry', 'Computer Science', 
  	'Drama', 'Economics', 'English', 'Geography', 'History', 'Mathematics', 'Music', 'Physics']

  GRADES = ['8', '9', '10', '11', '12']

  def self.search(query)
   where("name ILIKE ? or category ILIKE ?", "%#{query}%", "%#{query}%")
  end
end
