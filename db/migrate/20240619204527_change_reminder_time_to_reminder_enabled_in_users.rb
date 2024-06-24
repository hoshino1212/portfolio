class ChangeReminderTimeToReminderEnabledInUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :reminder_time, :datetime
    add_column :users, :reminder_enabled, :boolean, default: false
  end
end
