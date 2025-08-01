class ExpenseReportsController < ApplicationController
  before_action :set_expense_report, only: %i[show edit update destroy]

  def index
    @wards = Ward.all
    @expense_reports = ExpenseReport.order(report_date: :desc)

    # Search filter by category
    if params[:search].present?
      @expense_reports = @expense_reports.where("category LIKE ?", "%#{params[:search]}%")
    end

    # Filter by ward
    if params[:ward_id].present?
      @expense_reports = @expense_reports.where(ward_id: params[:ward_id])
    end

    # Apply pagination
    @expense_reports = @expense_reports.page(params[:page]).per(10)

    # Respond with HTML or CSV
    respond_to do |format|
      format.html
      format.csv { send_data @expense_reports.to_csv, filename: "expense_reports-#{Date.today}.csv" }
    end
  end

  def show; end

  def new
    @expense_report = ExpenseReport.new
  end

  def edit; end

  def create
    @expense_report = ExpenseReport.new(expense_report_params)
    if @expense_report.save
      redirect_to @expense_report, notice: 'Expense report was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @expense_report.update(expense_report_params)
      redirect_to @expense_report, notice: 'Expense report was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @expense_report.destroy
    redirect_to expense_reports_url, notice: 'Expense report was successfully deleted.'
  end

  private

  def set_expense_report
    @expense_report = ExpenseReport.find(params[:id])
  end

  def expense_report_params
    params.require(:expense_report).permit(:ward_id, :category, :amount, :report_date)
  end
end
