class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    UserMailer.welcome(user)
  end

  def newsletter
    user = User.first
    UserMailer.newsletter(user)
  end
end
