class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#  include HttpAcceptLanguage::AutoLocale

  before_filter :set_locale
  include Pundit

  def default_url_options(options={})
      { locale: I18n.locale }
    end

  private
   def extract_locale_from_accept_language_header
     request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
   end

   def set_locale
     I18n.locale = params[:locale] || extract_locale_from_accept_language_header || I18n.default_locale
   end

  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
    end

end
