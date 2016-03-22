class ClientsController < ApplicationController
  def index 
    @clients = Client.all
  end

  def create
    @user = current_user
    @client = current_user.clients.build(client_params)
    if @client.save
       ####
       # JobPdf.send_signup_email(@user).deliver
       ####
      flash[:notice] = "Client Added"
      redirect_to client_path(@client)
    else
      flash[:notice] = "#{@client.errors.full_messages.first}"
      redirect_to @user
    end
  end

  def show
    @client = Client.find(params[:id])
    @job = Job.new
  end

  def edit
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    if @client.save
      flash[:notice] = "Client Info Updated"
      redirect_to client_path(@client)
    else
      flash[:notice] = "#{errors.full_messages.first}"
      redirect_to client_path(@client)
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash[:notice] = "Client Removed"
    redirect_to user_path(current_user)
  end

  private
  def client_params
    params.require(:client).permit(:fname, :lname, :street, :state, :city, :zip, :business_name, :email, :phone)
  end
end
