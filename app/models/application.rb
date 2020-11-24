class Application < ApplicationRecord
  belongs_to :user
  has_many :status_updates, dependent: :destroy
  has_many :notes, dependent: :destroy
end
