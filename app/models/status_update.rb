class StatusUpdate < ApplicationRecord
  belongs_to :application, dependent: :destroy
end
