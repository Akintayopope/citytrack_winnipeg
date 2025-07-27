class Ward < ApplicationRecord
  has_many :service_requests
  has_many :expense_reports
  has_many :events

  validates :name, presence: true
  validates :district, presence: true
end
