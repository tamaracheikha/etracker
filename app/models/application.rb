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

  def display_icon
    if self.application_status == "Saved"
      "far fa-star"
    elsif self.application_status == "Applied"
      "far fa-file"
    elsif self.application_status == "Interviewing"
      "fas fa-phone"
    elsif self.application_status == "Offer"
      "fas fa-award"
    elsif self.application_status == "Rejected"
      "far fa-thumbs-down"
    else
      "far fa-star"
    end
  end
end
