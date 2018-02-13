class FrontController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :set_locale
  before_action :set_shopping_cart

  # include Mobylette::RespondToMobileRequests

  layout 'top_layout'
  add_breadcrumb "#{Settings.site[:name]} Home", :root_path

  def set_shopping_cart
    return nil unless user_signed_in?

    return Cart.new(current_user).save if session[:cart_id].nil?
    Cart.find(session[:cart_id])
  end

  def track_visit_into_session
    controller_name = params[:controller].split('/')[1]
    session_sym = "#{controller_name}_session_list".to_sym

    session[session_sym] = [] if session[session_sym].nil?
    session[session_sym].push(params[:id].to_i) unless session[session_sym].include?(params[:id].to_i)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale unless params[:locale] == 'favicon'
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
  end
end
