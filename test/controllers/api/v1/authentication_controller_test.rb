require 'test_helper'

module Api
  module V1
    class AuthenticationControllerTest < ActionDispatch::IntegrationTest
      setup do
        @user = users(:one)
        @user2 = {
          user: {
            email: @user.email,
            password: 'secret'
          }
        }
        @new_user = {
          user: {
            email: 'lamido@test.com',
            password: 'lamidotijjani'
          }
        }
      end

      test 'should user login' do
        post api_v1_auth_login_url, params: @user2, as: :json

        assert_response 200
      end

      test 'should not login user' do
        post api_v1_auth_login_url, params: @new_user, as: :json

        assert_response :unauthorized
      end

      test 'should get JWT token' do
        post api_v1_auth_login_url, params: { user: { email: @user.email, password: 'secret' } }, as: :json
        assert_response :success

        json_response = JSON.parse(response.body)
        assert_not_nil json_response['token']
      end

      test 'should not get JWT token' do
        post api_v1_auth_login_url, params: { user: { email: @user.email, password: 'b@d_pa$$' } }, as: :json
        assert_response :unauthorized
      end
    end
  end
end
