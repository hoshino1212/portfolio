class AddSendReminderEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :send_reminder_email, :boolean, default: false
  end
end
