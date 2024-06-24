# app/mailers/reminder_mailer.rb
class ReminderMailer < ApplicationMailer
  def send_reminder_email(user)
    @user = user
    @smoking_data = @user.smoking_data || @user.build_smoking_data

    mail(to: @user.email, subject: 'Reminder Email')
  end

  def self.send_reminder_email_to_all_users
    users = User.all

    users.each do |user|
      ReminderMailer.send_reminder_email(user).deliver_now
    end
  end
end
