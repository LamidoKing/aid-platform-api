require 'test_helper'

class MessageChannelTest < ActionCable::Channel::TestCase
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

  test 'subscribes' do
    subscribe
    assert subscription.confirmed?
  end
  test 'should Broadcast message to uniques channel' do
    assert_broadcasts('message_channel_12', 1) do
      ActionCable.server.broadcast 'message_channel_12', @new_message
    end
  end

  test 'should not Broadcast message to other channel' do
    # Check that no broadcasts has been made
    assert_no_broadcasts('message_channel_13') do
      ActionCable.server.broadcast('message_channel_12', @new_message)
    end
  end
end
