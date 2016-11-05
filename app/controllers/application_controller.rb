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

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
    #Below are other methods to define locale language

    #url options : prepend(host/lang/path) or append(host/path/lang)

      #current_user.locale -- language set in user profile
      #request.subdomain -- lookup
      #request.evn["HTTP_ACCEPT_LANGUAGE"] -- value given by users browser
      #request.remote_ip -- determine location via some sort of geo location
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
