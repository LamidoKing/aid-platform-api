# Request Controller
class Api::V1::RequestsController < ApplicationController
  before_action :authorized, only: [:create, :update, :destroy, :volunters]
  before_action :set_request, only: [:show, :update, :destroy, :volunters]
  before_action :require_owner, only: [:update, :destroy]

  # GET /api/v1/requests
  def index
    @requests = Request.all

    json_response(@requests)
  end

  # GET /api/v1/requests/1
  def show
    json_response(@request)
  end

  def volunters
    @volunters =  @request.message.where.not(sender: @current_user).map(&:sender).uniq

    json_response(@volunters)
  end

  # POST /api/v1/requests
  def create
    @request = current_user.requests.create!(request_params)

    json_response(@request, :created)
  end

  # PATCH/PUT /api/v1/requests/1
  def update
    @request.update!(request_params)
    json_response(@request)
  end

  # DELETE /api/v1/requests/1
  def destroy
    @request.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def request_params
    params.fetch(:request, {}).permit(:title, :description, :status, :type_of_request, :latitude, :longitude)
  end

  # Only allow owner
  def require_owner
    return if @request.user == current_user

    json_response({ message: 'your are not owner of this request' }, :unauthorized)
  end
end
