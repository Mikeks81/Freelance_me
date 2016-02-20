class ClientsController < ApplicationController
  def create
    @user = current_user
    @client = current_user.clients.build(client_params)
    if @client.save
      flash[:notice] = "Client Added"
      redirect_to @user
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
  end

  def destroy
  end

  private
  def client_params
    params.require(:client).permit(:fname, :lanem, :address, :business_name, :email, :phone)
  end
end
