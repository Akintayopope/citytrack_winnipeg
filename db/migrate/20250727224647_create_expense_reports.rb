class CreateExpenseReports < ActiveRecord::Migration[8.0]
  def change
    create_table :expense_reports do |t|
      t.references :ward, null: false, foreign_key: true
      t.string :category
      t.decimal :amount
      t.date :report_date

      t.timestamps
    end
  end
end
