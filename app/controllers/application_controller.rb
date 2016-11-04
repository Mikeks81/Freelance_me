class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   # helper_method :current_user

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

  protect_from_forgery with: :exception
end
