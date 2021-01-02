# Fulfill Request controller
class Api::V1::FulfillRequestController < ApplicationController
  before_action :authorized, only: [:update]
  before_action :set_request, only: [:update]

  # PATCH/PUT /api/v1/fulfill/1
  def update
    @request.update!(fulfill_params)
    FulfiiledRequestMailer.with(request: @request).request_fulfilled.deliver_now
    json_response(@request)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def fulfill_params
    params.fetch(:request, {}).permit(:status)
  end
end
