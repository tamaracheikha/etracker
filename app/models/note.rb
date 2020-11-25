class Note < ApplicationRecord
  belongs_to :application
  has_rich_text :rich_content
end
