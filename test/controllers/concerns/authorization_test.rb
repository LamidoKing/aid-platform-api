class MockController
  include Authorization
  attr_accessor :request

  def initialize
    mock_request = Struct.new(:headers)
    self.request = mock_request.new({})
  end
end

class AuthenticableTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @authorization = MockController.new
  end

  test 'should get user from Authorization token' do
    @authorization.request.headers['Authorization'] = 'Bearer ' + JsonWebToken.encode(user_id: @user.id)
    assert_equal @user.id, @authorization.current_user.id
  end
end
