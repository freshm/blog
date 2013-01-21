class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.signed_up.subject
  #
  def signed_up(user)
    @user = user
    @url = 
    
    mail to: user.email, subject: 'Sign Up Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.friend_request.subject
  #
  def friend_request
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
