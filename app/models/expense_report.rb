class ExpenseReport < ApplicationRecord
  belongs_to :ward

  validates :category, presence: true
  validates :amount, numericality: true

end
