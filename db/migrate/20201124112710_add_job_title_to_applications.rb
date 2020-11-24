class AddJobTitleToApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :applications, :job_title, :text
  end
end
