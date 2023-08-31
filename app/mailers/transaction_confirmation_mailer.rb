# frozen_string_literal: true

# Transaction Confirmation Mailer
class TransactionConfirmationMailer < ApplicationMailer

  def conf_mailer(user, message)
    @user = user
    @message = message

    mail(to: @user, subject: 'Transaction Complete') do |format|
      format.text
      format.html
    end
  end
end
