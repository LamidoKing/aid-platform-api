module Api
  module V1
    # Login Class
    class AuthenticationController < ApplicationController
      # POST /api/v1/auth/login
      def login
        @user = Authentication.new(login_params)

        if @user.authenticate
          render json: {
            message: 'Login successful!',
            token: @user.generate_token,
            user: @user.user_data
          }, except: [:password_digest]
        else
          render json: {
            message: 'Incorrect username/password combination'
          }, status: :unauthorized
        end
      end

      private

      # Only allow a trusted parameter "white list" through.
      def login_params
        params.fetch(:user, {}).permit(:email, :password)
      end
    end
  end
end
