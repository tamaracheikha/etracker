class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.string :company_name
      t.text :job_description
      t.string :application_status
      t.string :company_link

      t.timestamps
    end
  end
end
