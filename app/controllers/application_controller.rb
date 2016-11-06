class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def current_user
  	if session[:user_id]
		  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
  end

  protected
  def convert_bigD_to_string value
  	values = value.to_s.split('.')

  	values[0].reverse!.gsub!(/(\d{3})(?=\d)/, '\\1,').reverse! if values[0].length > 3

  	values[1] += "0" if values[1].length == 1
  		
  	"$" + values.join('.')
    	
  end

  def browser_default_lang
    #if browser default language is a supported langage return that val
    lang = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first 
    I18n.available_locales.each {|l| return l if l == lang.to_sym}
  end

  def set_locale
    # heirachy of locale set = current_user > params[:locale] > browser_default_lang > application default
    I18n.locale = current_user.try(:locale) || (params[:locale] if params[:locale].present?) || browser_default_lang || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
