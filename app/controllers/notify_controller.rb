# frozen_string_literal: true

# Notifier Controller
class NotifyController < ApplicationController
  def notify
    render json: { ok: :success }
  end

  def simple
    begin
      QuikkSendService.new(params[:simple]).call
      render json: { message: 'request received for processing' }, status: :ok
    rescue StandardError => e
      render json: { error: e.message }, status: :bad_request
    end
  end

  private

  def simple_params
    params.require(:simple).permit(:contact, :mode, :message)
  end
end
