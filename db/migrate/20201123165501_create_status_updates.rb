class CreateStatusUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :status_updates do |t|
      t.string :content
      t.date :date
      t.references :application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
