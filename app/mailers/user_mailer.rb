class UserMailer < ActionMailer::Base
  default from: "contacto@sinapsis-cmms.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Restablecer Password"
  end

  def new_account(user, plan)
    @user = user
    @plan = plan
    mail to: user.email, subject: "Bienvenido a Sinapsis"
  end
end
