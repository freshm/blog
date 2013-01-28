class Notifier < ActionMailer::Base
  default from: "marvin.ahlgrimm@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.signed_up.subject
  #
  def signed_up(user)
    @user = user
    
    mail to: @user.email, subject: 'Sign Up Confirmation.'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.friend_request.subject
  #
  def friend_request(user, other_user)
    @friendship = Friendship.where(other_friend_id: other_user).where(friend_id: user).first
    @user = user
    @other_user = other_user

    mail to: @other_user.email, subject: "Friend request."
  end
end
