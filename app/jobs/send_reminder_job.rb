# app/jobs/send_reminder_job.rb

class SendReminderJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    @user = User.find_by(id: user_id)
    return unless @user

    @smoking_data = @user.smoking_data.last # 例として最新のデータを取得するが、適切な方法でデータを取得すること

    if @smoking_data
      # メール送信
      ReminderMailer.send_reminder_email(@user, @smoking_data).deliver_now
    end
  end
end
