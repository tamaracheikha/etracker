class Application < ApplicationRecord
  belongs_to :user
  has_many :status_updates
  has_many :notes
  has_one_attached :cv
  has_one_attached :cover_letter
end
