class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for loggin in!"
      redirect_to user_path(@user)
    else
      flash[:notice] = "#{@user.errors.full_messages.first}"
      render 'sessions/index'
    end
  end

  def show
    @user = User.find(params[:id])
    @client = Client.new
    @clients = Client.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :business_name)
  end
end
