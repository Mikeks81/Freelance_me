class SessionsController < ApplicationController
  def index
    @user = User.new
    render layout: "sessions_layout"
  end

  def create
  	@user = User.where(email: params[:email]).first
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
      # sets locale for url and flash message on log in -- current_user seems to set after... d
      #putting User.find(session[:user_id]) in set_locale seems not to correct the problem 
      I18n.locale = @user.locale.to_sym
  		flash[:notice] = t('sessions.flash.user_log_in', fname: @user.fname)
  		redirect_to user_path(@user)
  	else 
  		flash[:notice] = "Incorrect Email or Password"
  		redirect_to root_path
  	end
  end

  def destroy
    @user = current_user
    if @user
      flash[:notice]= t "sessions.flash.user_log_out"
      session.clear
      redirect_to root_path
    end
  end
end
