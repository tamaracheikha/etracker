class AddUserToApplications < ActiveRecord::Migration[6.0]
  def change
    add_reference :applications, :user, null: false, foreign_key: true
  end
end
