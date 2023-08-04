class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable,  :omniauthable, omniauth_providers: [:github]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:github]
  # after_create :send_new_account_notification
  after_create :send_welcome_email
  # private
  # def send_welcome_email
  #   UserMailer.welcome_email(self).deliver_now
  # end
  private
     def send_welcome_email
       SendEmailsJob.set(wait: 3.minutes).perform_later(self)
     end
  # private

  # def send_new_account_notification
  #   UserMailer.new_account_notification(self).deliver_now
  # end
  # def self.from_omniauth(access_token)
  #   data = access_token.info
  #   user = User.where(email: data['email']).first

  #   # Uncomment the section below if you want users to be created if they don't exist
  #   unless user
  #       user = User.create(
  #          email: data['email'],
  #          password: Devise.friendly_token[0,20]
  #       )
  #   end
  #   user
  # end
  def self.from_omniauth(auth)
  user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
  end
  user
  end

end
