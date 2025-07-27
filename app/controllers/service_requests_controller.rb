class ServiceRequestsController < ApplicationController
  def index
    @wards = Ward.all
    @service_requests = ServiceRequest.all

    # Apply search if query is present
    if params[:search].present?
      @service_requests = @service_requests.where(
        "category LIKE ? OR description LIKE ?",
        "%#{params[:search]}%",
        "%#{params[:search]}%"
      )
    end

    # Apply ward filter if ward_id is present
    if params[:ward_id].present?
      @service_requests = @service_requests.where(ward_id: params[:ward_id])
    end
  end
end
