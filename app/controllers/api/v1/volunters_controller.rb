# Volunters controller
class Api::V1::VoluntersController < ApplicationController
  before_action :authorized
  before_action :set_volunter, only: [:show, :update, :destroy]

  # GET /api/v1/volunters
  def index
    @volunters = @current_user.volunters

    json_response(@volunters)
  end

  # GET /api/v1/volunters/1
  def show
    json_response(@volunter)
  end

  # POST /api/v1/volunters
  def create
    is_user_request = Request.find_by(id: volunter_params[:request_id])

    if is_user_request.user_id == @current_user.id
      json_response({ message: 'You cannot Volunter to your Request' }, :unprocessable_entity)

    else
      @volunter = @current_user.volunters.create!(volunter_params)

      json_response(@volunter, :created)
    end
  end

  # PATCH/PUT /api/v1/volunters/1
  def update
    @volunter.update!(volunter_params)

    json_response(@volunter)
  end

  # DELETE /api/v1/volunters/1
  def destroy
    @volunter.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_volunter
    @volunter = @current_user.volunters.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def volunter_params
    params.fetch(:volunter, {}).permit(:request_id)
  end
end
