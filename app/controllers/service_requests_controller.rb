class ServiceRequestsController < ApplicationController
  before_action :set_service_request, only: %i[show edit update destroy]

  def index
    @wards = Ward.all
    @service_requests = ServiceRequest.all

    if params[:search].present?
      @service_requests = @service_requests.where(
        "category LIKE ? OR description LIKE ?",
        "%#{params[:search]}%",
        "%#{params[:search]}%"
      )
    end

    if params[:ward_id].present?
      @service_requests = @service_requests.where(ward_id: params[:ward_id])
    end

    @service_requests = @service_requests.page(params[:page]).per(10) # Kaminari pagination
  end

  def show; end

  def new
    @service_request = ServiceRequest.new
  end

  def edit; end

  def create
    @service_request = ServiceRequest.new(service_request_params)
    if @service_request.save
      redirect_to @service_request, notice: "Service request was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @service_request.update(service_request_params)
      redirect_to @service_request, notice: "Service request was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service_request.destroy
    redirect_to service_requests_url, notice: "Service request was successfully deleted."
  end

  private

  def set_service_request
    @service_request = ServiceRequest.find(params[:id])
  end

  def service_request_params
    params.require(:service_request).permit(:ward_id, :category, :description, :status, :request_date)
  end
end
