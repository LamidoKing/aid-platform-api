require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'test', password_digest: 'test')
    @user.govnt_id.attach(io: File.open(Rails.root.join('seedFiles/gvnt.jpg')), filename: 'update.jpg', content_type: 'image/jpg')
  end
  # test "the truth" do
  #   assert true
  # end
  test 'should not save user without all field present' do
    user = User.new
    assert_not user.save
  end

  test 'user with a valid email should be valid' do
    user = User.new(email: 'test@gmail.com', password_digest: 'test', first_name: 'lamido', last_name: 'tijjani')
    user.govnt_id.attach(io: File.open(Rails.root.join('seedFiles/govnt_id.pdf')), filename: 'govnt_id.pdf', content_type: 'application/pdf')
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
  test 'user with valid content-type' do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: 'test')
    user.govnt_id.attach(io: File.open(Rails.root.join('seedFiles/update.svg')), filename: 'update.svg', content_type: 'application/svg')
    assert_not user.valid?
  end
  should validate_content_type_of(:govnt_id).rejecting('text/svg', 'text/xml')

  test 'user with govnt_id size than 5mb should be invalid' do
    user = User.new(email: 'test', password_digest: 'test')
    user.govnt_id.attach(io: File.open(Rails.root.join('seedFiles/gvnt.jpg')), filename: 'gvnt.jpg', content_type: 'image/jpg')
    assert_not user.valid?
  end
end
