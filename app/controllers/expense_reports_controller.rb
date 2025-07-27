class ExpenseReportsController < ApplicationController
  def index
    @wards = Ward.all
    @expense_reports = ExpenseReport.all

    # Apply search if query is present
    if params[:search].present?
      @expense_reports = @expense_reports.where(
        "category LIKE ?",
        "%#{params[:search]}%"
      )
    end

    # Apply ward filter if ward_id is present
    if params[:ward_id].present?
      @expense_reports = @expense_reports.where(ward_id: params[:ward_id])
    end
  end
end
