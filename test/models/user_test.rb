require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save user without all field present' do
    user = User.new
    assert_not user.save
  end

  test 'user with a valid email should be valid' do
    user = User.new(email: 'test@gmail.com', password_digest: 'test', first_name: 'lamido', last_name: 'tijjani')
    assert user.valid?
  end

  test 'user with invalid email should be invalid' do
    user = User.new(email: 'test', password_digest: 'test')
    assert_not user.valid?
  end

  test 'user with taken email should be invalid' do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: 'test')
    assert_not user.valid?
  end
end
