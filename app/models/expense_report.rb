require 'csv'

class ExpenseReport < ApplicationRecord
  belongs_to :ward

  validates :category, presence: true
  validates :amount, numericality: true

  def self.to_csv
    attributes = %w{id ward_name category amount report_date created_at updated_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      total_amount = 0

      all.includes(:ward).find_each do |report|
        total_amount += report.amount
        csv << [
          report.id,
          report.ward&.name,  # Use ward name instead of ID
          report.category,
          sprintf('%.2f', report.amount), # Format amount as 2 decimals
          report.report_date,
          report.created_at,
          report.updated_at
        ]
      end

      # Add a blank row and TOTAL row at the end
      csv << []
      csv << ["", "", "TOTAL", sprintf('%.2f', total_amount), "", "", ""]
    end
  end
end
