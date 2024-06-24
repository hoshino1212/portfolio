class RemoveReminderColumnsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :reminder_enabled, :boolean
    remove_column :users, :send_reminder_email, :boolean
  end
end
