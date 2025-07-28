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

  @service_requests = @service_requests.page(params[:page]).per(10) # Pagination
end
