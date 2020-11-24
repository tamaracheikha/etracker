class Application < ApplicationRecord
  belongs_to :user
  has_many :status_updates, dependent: :destroy
  has_many :notes, dependent: :destroy
  STATUSES = ["Saved", "Applied", "Interviewing", "Offer"]
  validates :application_status, inclusion: { in: STATUSES }
end
