# Request Controller
class Api::V1::RequestsController < ApplicationController
  before_action :authorized, only: [:create, :update, :destroy, :volunters, :volunter_by_me, :republish]
  before_action :set_request, only: [:show, :update, :destroy, :volunters, :republish]
  before_action :require_owner, only: [:update, :destroy, :republish]

  # GET /api/v1/requests
  def index
    @requests = Request.all

    json_response(@requests)
  end

  # GET /api/v1/requests_volunter_by_me Requests i volunter
  def volunter_by_me
    @requests = @current_user.volunters.map(&:request)
    json_response(@requests)
  end

  # GET /api/v1/requests/1
  def show
    json_response(@request)
  end

  # GET /api/v1/requests/volunters/1
  def volunters
    @volunters =  @request.volunters

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

  # PATCH/PUT /api/v1/requests/republish/1
  def republish
    @volunters = @request.volunters

    found = @volunters.select { |v| Time.new - v.created_at >= 1.day }
    if found.length >= 1 && @request.status == 'Unfulfill'
      @request.update!(request_params)
      json_response(@volunters)
    else
      json_response({ message: 'Request cant not be republish' }, :unauthorized)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def request_params
    params.fetch(:request, {}).permit(:title, :description, :status, :type_of_request, :latitude, :longitude, :republished)
  end

  # Only allow owner
  def require_owner
    return if @request.user == current_user

    json_response({ message: 'your are not owner of this request' }, :unauthorized)
  end
end
