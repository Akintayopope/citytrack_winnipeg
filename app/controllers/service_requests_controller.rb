class ServiceRequestsController < ApplicationController
  def index
  @wards = Ward.all
  @service_requests = ServiceRequest.includes(:ward).order(request_date: :desc)

  @requests_per_ward = ServiceRequest.joins(:ward).group("wards.name").count
  @requests_by_status = ServiceRequest.group(:status).count

  if params[:search].present?
    @service_requests = @service_requests.where(
      "category LIKE :q OR description LIKE :q",
      q: "%#{params[:search]}%"
    )
  end

  if params[:ward_id].present?
    @service_requests = @service_requests.where(ward_id: params[:ward_id])
  end

  if params[:status].present?
    @service_requests = @service_requests.where(status: params[:status])
  end

  @service_requests = @service_requests.page(params[:page]).per(10)
end
def show
  @service_request = ServiceRequest.find(params[:id])
end



end