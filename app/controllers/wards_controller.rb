class WardsController < ApplicationController
  # Display a list of all wards
  def index
    @wards = Ward.all
  end

  # Display a single ward and its associated data
  def show
    @ward = Ward.find(params[:id])
    @service_requests = @ward.service_requests
    @expense_reports = @ward.expense_reports
    @events = @ward.events
  end

  def new
    @ward = Ward.new
  end

  def edit
    @ward = Ward.find(params[:id])
  end
  def show
  @ward = Ward.includes(:service_requests, :expense_reports, :events).find(params[:id])
end

end
