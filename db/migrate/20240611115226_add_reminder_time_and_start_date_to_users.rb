class AddReminderTimeAndStartDateToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reminder_time, :datetime
    add_column :users, :start_date, :datetime
  end
end
