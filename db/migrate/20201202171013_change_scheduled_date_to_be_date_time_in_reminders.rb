class ChangeScheduledDateToBeDateTimeInReminders < ActiveRecord::Migration[6.0]
  def change
    change_column :reminders, :scheduled_date, :datetime
  end
end
