require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should save Request with all field valid' do
    request = Message.new({
                            sender_id: users(:one).id,
                            receiver_id: users(:two).id,
                            request_id: requests(:one).id,
                            message: 'MyText'
                          })
    assert request.save
  end

  test 'should not save Request without all field valid' do
    request = Message.new
    assert_not request.save
  end
end
