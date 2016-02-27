class JobitemsController < ApplicationController
  def create
  	@client = Client.find(params[:client_id])
    @job = Job.find(params[:job_id])
  	@jobitem = @job.jobitems.build(jobitem_params)
  	if @jobitem.save
  		flash[:notice] = "Item Added"
  		redirect_to client_job_path(@client,@job)
  	else
  		flash[:notice] = "#{errors.full_messages.first}"
  		redirect_to client_job_path(@client,@job)
  	end
  end

  def update
  end

  def destroy
  	@client = Client.find(params[:client_id])
    @job = Job.find(params[:job_id])
  	@jobitem = Jobitem.find(params[:id])
  	@jobitem.destroy
  	flash[:notice] = "Item Removed"
  	redirect_to client_job_path(@client,@job)
  end

  private

  def jobitem_params
  	params.require(:jobitem).permit(:name,:date,:price)
  end

end
