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
  	value = value.to_s
  	after_decimal = value.split('.')[1]

  	if after_decimal.length == 1
  		after_decimal += "0"
  		"$" + value.split('.')[0] + "." + after_decimal
  	else
  		"$" + value
  	end

  	 

  end

  protect_from_forgery with: :exception
end
