class Application < ApplicationRecord
  belongs_to :user
  has_many :status_updates, :notes
end
