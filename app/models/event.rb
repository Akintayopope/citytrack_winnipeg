class Event < ApplicationRecord
  belongs_to :ward

  validates :name, presence: true
  validates :event_date, presence: true
  validates :location, presence: true
end
