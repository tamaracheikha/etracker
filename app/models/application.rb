class Application < ApplicationRecord
  belongs_to :user
  STATUSES = ["Saved", "Applied", "Interviewing", "Offer"]
  validates :application_status, inclusion: { in: STATUSES }
  has_many :status_updates
  has_many :notes
end
