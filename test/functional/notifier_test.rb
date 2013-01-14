require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "signed_up" do
    mail = Notifier.signed_up
    assert_equal "Sign Up Confirmation", mail.subject
    assert_equal ["johnwayne@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "friend_request" do
    mail = Notifier.friend_request
    assert_equal "Friend request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
