# frozen_string_literal: true

class MessageResource < JSONAPI::Resource
  attributes :contact, :mode, :message

  after_create do
    QuikkSendService.new(@model).call
  end
end
