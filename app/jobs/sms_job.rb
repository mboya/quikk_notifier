# frozen_string_literal: true
require 'AfricasTalking'

# sms job
class SmsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @at_sms = AfricasTalking::Initialize.new(ENV['AT_USERNAME'], ENV['AT_APIKEY'])
    send_sms(args[0], args[1], args[2])
  end

  private

  def send_sms(to, message, id)
    begin
      sms = @at_sms.sms
      options = { 'to' => to, 'message' => message, 'from' => ENV['AT_SENDERID'] }
      reports = sms.send options
      update_message(id, reports.to_json) unless id.nil?
      puts reports.to_json
    rescue AfricasTalking::AfricasTalkingException => ex
      puts "Encountered an error: #{ex.message}"
    end
  end

  def update_message(message_id, response)
    Message.find_by(id: message_id).update(provider_feedback: response)
  end
end
