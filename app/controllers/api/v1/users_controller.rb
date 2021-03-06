# User CRUD Controller
class Api::V1::UsersController < ApplicationController
  before_action :authorized, only: [:update, :destroy]
  before_action :set_user, only: [:update, :destroy]

  # GET /api/v1/users
  # def index
  #   @users = User.all

  #   reponse(@users)
  # end

  # GET /api/v1/users/1
  def show
    @user = User.find(params[:id])
    json_response(@user)
  end

  # POST /api/v1/users
  def create
    @user = User.create!(user_params)

    user_data = {
      message: 'User creaed Successfull',
      token: JsonWebToken.encode(user_id: @user.id),
      user: @user
    }
    json_response(user_data, :created)
  end

  # PATCH/PUT /api/v1/users/1
  def update
    @user.update!(user_params)
    json_response(@user)
  end

  # DELETE /api/v1/users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = @current_user
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.fetch(:user, {}).permit(:first_name, :last_name, :email, :status, :password, :govnt_id)
  end
end
