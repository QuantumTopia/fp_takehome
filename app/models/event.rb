class Event < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :location, presence: true
  validates :date_time, presence: true
  validates :tickets_available, presence: true
end
