# frozen_string_literal: true

class QuikkSendService

  def initialize(data)
    @id = data[:id].present? ? data[:id] : nil
    @contact = data[:contact]
    @mode = data[:mode]
    @message = data[:message]
  end

  def call
    SmsJob.perform_now(@contact, @message, @id) if @mode.eql?('sms')
    EmailJob.perform_now(@contact, @message, @id) if @mode.eql?('email')
  end

end