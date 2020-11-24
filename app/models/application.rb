class Application < ApplicationRecord
  belongs_to :user
  has_many :status_updates, :notes
  STATUSES = ["Saved", "Applied", "Interviewing", "Offer"]
  validates :application_status, inclusion: { in: STATUSES }
end
