class ChangeScheduledDateToBeDateTimeInReminders < ActiveRecord::Migration[6.0]
  def change
    change_column :reminders, :scheduled_date, :datetime, limit: 6
  end
end
