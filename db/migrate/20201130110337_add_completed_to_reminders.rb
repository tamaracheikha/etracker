class AddCompletedToReminders < ActiveRecord::Migration[6.0]
  def change
    add_column :reminders, :completed, :boolean
  end
end
