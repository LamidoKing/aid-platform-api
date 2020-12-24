require 'test_helper'

class Api::V1::MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:one)
    @new_message = {
      message: {
        sender_id: users(:one).id,
        receiver_id: users(:two).id,
        request_id: requests(:one).id,
        message: 'MyText'
      }
    }
  end

  test 'should get index' do
    get api_v1_messages_url, headers: jwt(users(:one)), as: :json
    assert_response :success
  end

  test 'should create message' do
    assert_difference('Message.count') do
      post api_v1_messages_url, params: @new_message, headers: jwt(users(:one)), as: :json
    end

    assert_response 201
  end

  test 'should not create message' do
    assert_no_difference('Message.count') do
      post api_v1_messages_url, params: @new_message, as: :json
    end
    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
    assert_response :unauthorized
  end

  test 'should show message' do
    get api_v1_message_url(@message), headers: jwt(users(:one)), as: :json
    assert_response :success
  end

  test 'should not show message for unauthorize user' do
    get api_v1_message_url(@message), as: :json
    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
    assert_response :unauthorized
  end

  test 'should update message' do
    patch api_v1_message_url(@message), params: @new_message, headers: jwt(users(:one)), as: :json
    assert_response 200
  end

  test 'should not update message for Unauthorized Use' do
    patch api_v1_message_url(@message), params: @new_message, as: :json
    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
    assert_response :unauthorized
  end

  test 'should destroy message' do
    assert_difference('Message.count', -1) do
      delete api_v1_message_url(@message), headers: jwt(users(:one)), as: :json
    end

    assert_response 204
  end

  test 'should not destroy message for Unauthorized Use' do
    assert_no_difference('Message.count') do
      delete api_v1_message_url(@message), as: :json
    end
    json_response = JSON.parse(response.body)
    assert_not_nil json_response['message']
    assert_response :unauthorized
  end
end
