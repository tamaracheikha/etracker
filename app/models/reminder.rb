class Reminder < ApplicationRecord
  belongs_to :user
  belongs_to :application
end
