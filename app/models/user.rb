# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  phone_no               :string
#  date_of_birth          :datetime
#  role                   :integer          default(0)
#

class User < ActiveRecord::Base

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, 
           :omniauthable, :omniauth_providers => [:facebook]

    enum role: [:student, :tutor, :admin]

    has_many :courses

    # user and chat are many to many relation, I use has_many & through webinar
    has_many :webinars, :dependent => :destroy
    has_many :chats, :through => :webinars

    has_one :account

    mount_uploader :avatar, AvatarUploader
    mount_uploader :file, FileUploader

    acts_as_messageable

    def mailboxer_email(object)
      email
    end

    def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
      data = access_token.extra.raw_info
      if user = User.where(:email => data.email).first
        user
      else # Direct user to sign up page. 
        user = User.new # , notice: "Signing up with facebook, please enter a password!"
      end
    end

    # def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    #   data = access_token.extra.raw_info
    #   if user = User.where(:email => data.email).first
    #     user
    #   else # Create a user with a stub password. 
    #     User.create!(:email => data.email,
    #                  :name => data.name,
    #                  # :image => data.image,
    #                  :password => Devise.friendly_token[0,20])
    #   end
    # end

    def self.new_with_session(params, session)
        super.tap do |user|
          if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
            user.email = data["email"]
            user.name = data["name"]
            # user.image = data["image"]
          end
        end
    end

    def role?(r)
      role.include? r.to_s
    end

end
