class AddOtpExpirationTimeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :otp_expiration_time, :datetime
  end
end
