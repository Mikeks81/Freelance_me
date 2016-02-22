class JobsController < ApplicationController
  def create
    @user = current_user
    @client = Client.find(params[:client_id])
    @job = @client.jobs.build(job_params)
    if @job.save
      flash[:notice] = "Job Added"
      redirect_to client_job_path(@client,@job)
    else
      flash[:notice] = "Error. Job not added"
      redirect_to client_path(@client)
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private 

  def job_params
    params.require(:job).permit(:job_description, :date_of_job, :job_complete, :balance_zero, :notes, :date_of_end, :name, :time,:price,:balance)
  end 

end
