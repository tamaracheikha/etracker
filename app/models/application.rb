class Application < ApplicationRecord
  belongs_to :user
  belongs_to :company, optional: true

  has_one_attached :cv
  has_one_attached :cover_letter
  has_many :status_updates, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :reminders, dependent: :destroy
  STATUSES = ["Saved", "Applied", "Interviewing", "Offer", "Rejected"]
  validates :application_status, inclusion: { in: STATUSES }

  def pretty_name
    "#{self.company.name} - #{job_title} - #{application_status}"
  end
end
