def index
  @wards = Ward.all
  @expense_reports = ExpenseReport.all

  if params[:search].present?
    @expense_reports = @expense_reports.where(
      "category LIKE ?",
      "%#{params[:search]}%"
    )
  end

  if params[:ward_id].present?
    @expense_reports = @expense_reports.where(ward_id: params[:ward_id])
  end

  @expense_reports = @expense_reports.page(params[:page]).per(10) # Pagination
end
