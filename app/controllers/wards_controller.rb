class WardsController < ApplicationController
  # Display a list of all wards
  def index
    @wards = Ward.page(params[:page]).per(10) # Pagination for wards index
  end

  # Display a single ward and its associated data
  def show
    @ward = Ward.includes(:service_requests, :expense_reports, :events).find(params[:id])

    @service_requests = @ward.service_requests
                             .order(request_date: :desc)
                             .page(params[:service_page])
                             .per(5)

    @expense_reports = @ward.expense_reports
                            .order(report_date: :desc)
                            .page(params[:expense_page])
                            .per(5)

    @events = @ward.events
                   .order(event_date: :asc)
                   .page(params[:event_page])
                   .per(5)
  end

  def new
    @ward = Ward.new
  end

  def edit
    @ward = Ward.find(params[:id])
  end
end
