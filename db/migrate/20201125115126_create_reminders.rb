class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.string :title
      t.text :description
      t.date :scheduled_date

      t.timestamps
    end
  end
end
