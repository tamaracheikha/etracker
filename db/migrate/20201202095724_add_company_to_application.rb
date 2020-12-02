class AddCompanyToApplication < ActiveRecord::Migration[6.0]
  def change
    add_reference :applications, :company
  end
end
