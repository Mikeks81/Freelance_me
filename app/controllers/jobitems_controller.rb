class JobitemsController < ApplicationController
  def create
  	@client = Client.find(params[:client_id])
    @job = Job.find(params[:job_id])
  	@jobitem = @job.jobitems.build(jobitem_params)
    @jobitems = Jobitem.where(job_id: @job.id)

  	respond_to do |format|
      if @jobitem.save
        @tot_jobitem = convert_bigD_to_string(Job.job_total_jobitems(@job.id))
    		format.html {redirect_to client_job_path(@client,@job)}
        format.js 
    	else
    		format.html {redirect_to client_job_path(@client,@job)}
    	end
    end
    
  end

  def update
  end

  def destroy
  	@client = Client.find(params[:client_id])
    @job = Job.find(params[:job_id])
  	@jobitem = Jobitem.find(params[:id])
  	
  	respond_to do |format|
      if @jobitem.destroy
        @tot_jobitem = convert_bigD_to_string(Job.job_total_jobitems(@job.id))
        format.html {redirect_to client_job_path(@client,@job)}
        format.js
      end
    end

  end

  private

  def jobitem_params
  	params.require(:jobitem).permit(:name,:date,:price)
  end

end
