class Note < ApplicationRecord
  belongs_to :application, dependent: :destroy
end
