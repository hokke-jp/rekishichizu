class UserMailer < ApplicationMailer
  default from: 'rekishichizu.com <noreply@rekishichizu.com>'

  def account_activation(user)
    @user = user
    mail to: user.email, subject: 'アカウント有効化'
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'パスワード再発行'
  end
end
