require 'test_helper'

class Api::V1::FulfillRequestControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = requests(:one)
  end

  test 'should fullfill request' do
    patch api_v1_fulfill_request_url(@request), params: { request: { status: 'Fulfilled' } }, headers: jwt(users(:one)), as: :json
    assert_response 200
  end

  test 'should not update request without valid token' do
    patch api_v1_fulfill_request_url(@request), params: { request: { status: 'Fulfilled' } }, as: :json
    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']

    assert_response :unauthorized
  end
end
