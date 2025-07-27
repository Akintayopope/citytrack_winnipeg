class ServiceRequest < ApplicationRecord
  belongs_to :ward

  validates :category, :status, :request_date, presence: true
end
