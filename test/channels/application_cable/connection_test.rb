require 'test_helper'

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  test 'connect authorrize user' do
    connect "/cable?user=#{users(:one).id}"

    assert_equal connection.current_user.id, users(:one).id
  end

  test 'reject connection for unathorize user' do
    assert_reject_connection do
      connect
    end
  end
end
