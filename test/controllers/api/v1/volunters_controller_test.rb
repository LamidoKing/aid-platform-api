require 'test_helper'

class Api::V1::VoluntersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @volunter = volunters(:one)
    @new_volunter = {
      volunter: {
        request_id: requests(:two).id
      }
    }
  end

  test 'Authorize User should get index' do
    get api_v1_volunters_url, as: :json, headers: jwt(users(:one))
    assert_response :success
  end

  test 'UnAuthorize User should not get index' do
    get api_v1_volunters_url, as: :json
    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
    assert_response :unauthorized
  end

  test 'Authorize User should create volunter' do
    assert_difference('Volunter.count') do
      post api_v1_volunters_url, params: @new_volunter, headers: jwt(users(:one)), as: :json
    end

    assert_response 201
  end

  test 'Authorize User should not volunter to his request' do
    assert_no_difference('Volunter.count') do
      post api_v1_volunters_url, params: @volunter, headers: jwt(users(:one)), as: :json
    end

    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
    assert_response :unprocessable_entity
  end

  test 'UnAuthorize User should not create volunter' do
    assert_no_difference('Volunter.count') do
      post api_v1_volunters_url, params: @new_volunter, as: :json
    end

    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
    assert_response :unauthorized
  end

  test 'Authorize User should show volunter' do
    get api_v1_volunter_url(@volunter), headers: jwt(users(:one)), as: :json
    assert_response :success
  end

  test 'UnAuthorize User should not show volunter' do
    get api_v1_volunter_url(@volunter), as: :json

    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
    assert_response :unauthorized
  end

  test 'should update volunter' do
    patch api_v1_volunter_url(@volunter), params: @volunter, headers: jwt(users(:one)), as: :json
    assert_response 200
  end

  test 'UnAuthorize User should not update volunter' do
    patch api_v1_volunter_url(@volunter), params: @volunter, as: :json
    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
    assert_response :unauthorized
  end

  test 'should destroy volunter' do
    assert_difference('Volunter.count', -1) do
      delete api_v1_volunter_url(@volunter), headers: jwt(users(:one)), as: :json
    end

    assert_response 204
  end

  test 'UnAuthorize User should not destroy volunter' do
    assert_no_difference('Volunter.count') do
      delete api_v1_volunter_url(@volunter), as: :json
    end

    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
    assert_response :unauthorized
  end
end
