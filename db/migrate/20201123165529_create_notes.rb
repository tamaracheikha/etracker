class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.text :content
      t.string :title
      t.date :date
      t.references :application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
