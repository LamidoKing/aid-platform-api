require 'test_helper'

class PresenceChannelTest < ActionCable::Channel::TestCase
  include ActionCable::TestHelper
  test 'subscribes' do
    stub_connection(current_user: users(:one))
    subscribe
    unsubscribe
  end

  test 'unsubscribes' do
    stub_connection(current_user: users(:one))
    subscribe
    unsubscribe
  end

  test 'test broadcasts' do
    # Check the number of messages broadcasted to the stream
    assert_broadcasts 'presence_channel', 0
    ActionCable.server.broadcast 'presence_channel', users(:one).status
    assert_broadcasts 'presence_channel', 1
  end

  test 'Check that no broadcasts has been made' do
    assert_no_broadcasts('presence_channel') do
      ActionCable.server.broadcast 'another_stream', { text: 'hello' }
    end
  end
end
