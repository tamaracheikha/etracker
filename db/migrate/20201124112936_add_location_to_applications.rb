class AddLocationToApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :applications, :location, :string
  end
end
