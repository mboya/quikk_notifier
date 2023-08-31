# frozen_string_literal: true

# Email Job
class EmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    TransactionConfirmationMailer.conf_mailer(args[0], args[1]).deliver_now
    # TransactionConfirmationMailer.with(user: args[0], message: args[1]).mailer.deliver_now
  end
end
