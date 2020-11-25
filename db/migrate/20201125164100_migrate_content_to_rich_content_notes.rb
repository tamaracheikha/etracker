class MigrateContentToRichContentNotes < ActiveRecord::Migration[6.0]
  def up
    Note.find_each do |note|
      note.update(rich_content: note.content)
    end
  end

  def down
    Note.find_each do |note|
      note.update(content: note.rich_content)
      note.update(rich_content: nil)
    end
  end
end
