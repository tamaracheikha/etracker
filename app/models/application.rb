class Application < ApplicationRecord
  belongs_to :user

  has_one_attached :cv
  has_one_attached :cover_letter
  has_many :status_updates, dependent: :destroy
  has_many :notes, dependent: :destroy
  STATUSES = ["Saved", "Applied", "Interviewing", "Offer", "Rejected"]
  validates :application_status, inclusion: { in: STATUSES }
end
