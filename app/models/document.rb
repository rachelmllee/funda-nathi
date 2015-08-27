# == Schema Information
#
# Table name: documents
#
#  id                  :integer          not null, primary key
#  title               :string
#  description         :text
#  upload_file_name    :string
#  upload_content_type :string
#  upload_file_size    :integer
#  upload_updated_at   :datetime
#  course_id           :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  upload              :string
#

class Document < ActiveRecord::Base
  belongs_to :course

  has_attached_file :upload
  validates_attachment :upload, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end
