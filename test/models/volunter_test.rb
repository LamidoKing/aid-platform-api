require 'test_helper'

class VolunterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save user without all field present' do
    volunter = Volunter.new
    assert_not volunter.save
  end

  test 'should save user with all field present' do
    volunter = Volunter.new(request_id: requests(:one).id, user_id: users(:two).id)
    assert volunter.save
  end
end
