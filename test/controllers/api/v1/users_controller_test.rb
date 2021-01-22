require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user2 = users(:two)
    @new_user = {
      user: {
        first_name: 'testName',
        last_name: 'testLastName',
        email: 'test@test.com',
        password: 'testPassword'
      }
    }
    @govnt_id = fixture_file_upload('files/govnt_id.pdf', 'application/pdf')
    @user_new = {
      user: {
        first_name: 'testName',
        last_name: 'testLastName',
        email: 'test@test.com',
        password: 'testPassword',
        govnt_id: @govnt_id
      }
    }
  end

  # test 'should get all user' do
  #   get api_v1_users_url, as: :json
  #   assert_response :success
  # end

  test 'should create user' do
    assert_difference('User.count') do
      post api_v1_auth_signup_url, params: @user_new, as: :json
    end

    assert_response 201
  end

  test 'should not create user with taken email' do
    assert_no_difference('User.count') do
      post api_v1_auth_signup_url, params: @user, as: :json
    end

    assert_response :unprocessable_entity
  end

  test 'should show user' do
    get api_v1_user_url(@user), as: :json
    assert_response :success
  end

  test 'should update user' do
    patch api_v1_user_url(@user), params: @new_user,
                                  headers: { Authorization: 'Bearer ' + JsonWebToken.encode(user_id: @user.id) }, as: :json
    assert_response 200
  end

  test 'should not update user with taken email' do
    patch api_v1_user_url(@user), params: @user2,
                                  headers: { Authorization: 'Bearer ' + JsonWebToken.encode(user_id: @user.id) }, as: :json
    assert_response :unprocessable_entity
  end

  test 'should not update user with expire token' do
    patch api_v1_user_url(@user), params: @new_user,
                                  headers: { Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMywiZXhwIjoxNjA4MjM4NjY3fQ.XctzcRF8mnoU_BmNokOPhjHtKfdfoD8da0-nd5N5CXo' }
    assert_response :unauthorized

    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
  end

  test 'should not update user with invalid token' do
    patch api_v1_user_url(@user), params: @new_user, headers: { Authorization: 'Bearer fdfdfdfgdfgdfgdfgdfgdfgd' }
    assert_response :unauthorized

    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete api_v1_user_url(@user),
             headers: { Authorization: 'Bearer ' + JsonWebToken.encode(user_id: @user.id) }, as: :json
    end

    assert_response 204
  end

  test 'should not destroy user with expired tokenr' do
    delete api_v1_user_url(@user),
           headers: { Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMywiZXhwIjoxNjA4MjM4NjY3fQ.XctzcRF8mnoU_BmNokOPhjHtKfdfoD8da0-nd5N5CXo' }
    assert_response :unauthorized

    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
  end

  test 'should not destroy user with invalid token' do
    delete api_v1_user_url(@user), headers: { Authorization: 'Bearer fdfdfdfgdfgdfgdfgdfgdfgd' }
    assert_response :unauthorized

    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
  end
end
