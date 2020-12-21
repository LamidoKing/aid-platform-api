require 'test_helper'

class Api::V1::RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = requests(:one)
    @new_request = {
      request: {
        user: users(:one),
        title: 'test',
        description: 'my descriptions',
        type_of_request: 'Material Need',
        latitude: 1.5,
        longitude: 1.5,
        status: 'Unfulfill'
      }
    }
  end

  test 'should get index' do
    get api_v1_requests_url, as: :json
    assert_response :success
  end

  test 'should create request' do
    assert_difference('Request.count') do
      post api_v1_requests_url, params: @new_request, headers: jwt(users(:one)), as: :json
    end

    assert_response 201
  end

  test 'should not create request without valid token' do
    assert_no_difference('Request.count') do
      post api_v1_requests_url, params: @new_request, as: :json
    end

    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']

    assert_response :unauthorized
  end

  test 'should show request' do
    get api_v1_request_url(@request), as: :json
    assert_response :success
  end

  test 'should update request' do
    patch api_v1_request_url(@request), params: @new_request, headers: jwt(users(:one)), as: :json
    assert_response 200
  end

  test 'should not update request without valid token' do
    patch api_v1_request_url(@request), params: @new_request, as: :json
    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']

    assert_response :unauthorized
  end

  test 'should not update request without valid owner' do
    patch api_v1_request_url(@request), params: @new_request, headers: jwt(users(:two)), as: :json
    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']

    assert_response :unauthorized
  end

  test 'should destroy request' do
    assert_difference('Request.count', -1) do
      delete api_v1_request_url(@request), headers: jwt(users(:one)), as: :json
    end

    assert_response 204
  end

  test 'should not destroy request without valid token' do
    assert_no_difference('Request.count') do
      delete api_v1_request_url(@request), as: :json
    end
    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']

    assert_response :unauthorized
  end

  test 'should not destroy request without valid owner' do
    assert_no_difference('Request.count') do
      delete api_v1_request_url(@request), headers: jwt(users(:two)), as: :json
    end
    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']

    assert_response :unauthorized
  end
end
