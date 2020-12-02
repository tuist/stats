# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_raven_context
  protect_from_forgery with: :exception

  def home
  end

  protected
    def restrict_to_development
      head(:bad_request) unless Rails.env.development?
    end

  private
    def set_raven_context
      Raven.user_context(id: session[:current_user_id]) # or anything else in session
      Raven.extra_context(params: params.to_unsafe_h, url: request.url)
    end
end
