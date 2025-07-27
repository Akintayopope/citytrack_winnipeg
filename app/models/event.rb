class Event < ApplicationRecord
  belongs_to :ward

  validates :name, :location, :event_date, presence: true
end
