class ModifyUserFields < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :otp, :string
    remove_column :users, :otp_expiration_time, :datetime

    add_column :users, :otp, :string
    add_column :users, :otp_generated_at, :datetime
    add_column :users, :email_verified, :boolean, default: false
  end
end

