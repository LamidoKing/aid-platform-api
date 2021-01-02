require 'test_helper'

class VolunterNotifierMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should notifiy request owner for new request volunted' do
    assert_emails 1 do
      @email = VolunterNotifierMailer.with(request: volunters(:one)).volunted_to_request.deliver_now
    end
    assert_equal ['notifications@aidplatform.com'], @email.from
    assert_equal [users(:one).email], @email.to
    assert_equal 'New Volunteer', @email.subject
    assert_match users(:one).first_name, @email.text_part.body.encoded
    assert_match users(:one).first_name, @email.html_part.body.encoded
    assert_match requests(:one).title, @email.html_part.body.encoded
  end
end
