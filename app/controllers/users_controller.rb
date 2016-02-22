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
    if current_user
      @user = User.find(params[:id])
      @client = Client.new
      @clients = Client.all
      @jobs = Job.all
      respond_to do |format|
        format.html
        format.js
      end
    else 
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def calendar
    @user = current_user
    @jobs = Job.all
    respond_to do |format| 
      format.html
      format.js
    end
  end

  def destroy
  end

  private 

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :business_name)
  end
end
