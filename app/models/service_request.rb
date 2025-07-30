class ServiceRequest < ApplicationRecord
  belongs_to :ward

  validates :category, presence: true
  validates :status, presence: true
  validates :request_date, presence: true
end
