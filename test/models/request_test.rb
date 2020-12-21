require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  setup do
    @description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
           sed do eiusmod tempor incididunt ut labore et dolore
           magna aliqua. Ut enim ad minim veniam, quis nostrud
           ssssexercitation ullamco laboris nisi ut aliquip ex ea commodo
           consequat. Duis aute irure dolor in reprehenderit in voluptate'
  end

  test 'should not save Request without all field present' do
    request = Request.new
    assert_not request.valid?
  end

  test 'should save Request with all field valid' do
    request = Request.new({
                            user: requests(:one).user,
                            title: requests(:one).title,
                            description: requests(:one).description,
                            type_of_request: requests(:one).type_of_request,
                            latitude: requests(:one).latitude,
                            longitude: requests(:one).longitude,
                            status: requests(:one).status
                          })
    assert request.save
  end

  test 'should not save Request with description length morethan 300' do
    request = Request.new({
                            user: requests(:one).user,
                            title: requests(:one).title,
                            description: @description,
                            type_of_request: requests(:one).type_of_request,
                            latitude: requests(:one).latitude,
                            longitude: requests(:one).longitude,
                            status: requests(:one).status
                          })
    assert_not request.valid?
  end

  test 'should not save Request with invalid type_of_request' do
    request = Request.new({
                            user: requests(:one).user,
                            title: requests(:one).title,
                            description: requests(:one).description,
                            type_of_request: 'any',
                            latitude: requests(:one).latitude,
                            longitude: requests(:one).longitude,
                            status: requests(:one).status
                          })
    assert_not request.valid?
  end

  test 'should not save Request with invalid status' do
    request = Request.new({
                            user: requests(:one).user,
                            title: requests(:one).title,
                            description: requests(:one).description,
                            type_of_request: requests(:one).type_of_request,
                            latitude: requests(:one).latitude,
                            longitude: requests(:one).longitude,
                            status: 'any'
                          })
    assert_not request.valid?
  end
end
