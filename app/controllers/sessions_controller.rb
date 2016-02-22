class SessionsController < ApplicationController
  def index

  end

  def create
  	@user = User.where(email: params[:email]).first
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		flash[:notice] = "Welcome back #{@user.fname}."
  		redirect_to user_path(@user)
  	else 
  		flash[:notice] = "Incorrect Email or Password"
  		redirect_to root_path
  	end
  end

  def destroy
    @user = current_user
    if @user
      flash[:notice]="Successfully logged out"
      session.clear
      redirect_to root_path
    end
  end
end
