class AddStatusToReminders < ActiveRecord::Migration[6.0]
  def change
    add_column :reminders, :status, :string
  end
end
