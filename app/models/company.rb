class Company < ApplicationRecord
  has_many :applications
  has_one_attached :photo
end
