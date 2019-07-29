# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_one_time_password

  def send_otp
    puts "OTP is #{self.otp_code}"
    TwilioClient.new.send_sms(to: '+91'+self.phone, body: "Your OTP of my awesome website is #{self.otp_code}")
  end
  
end
