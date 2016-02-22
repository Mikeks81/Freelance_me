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

  def new 

  end

  def show
    @client = Client.find(params[:client_id])
    @job = Job.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'file_name',
        :template => 'jobs/show.pdf.erb',
        :layout => 'pdf.html.erb',
        :show_as_html => params[:debug].present?
      end
    end
  end

  def invoice
    @client = Client.find(params[:client_id])
    @job = Job.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'file_name',
        :template => 'jobs/show.pdf.erb',
        :layout => 'pdf.html.erb',
        :show_as_html => params[:debug].present?
      end
    end

  end

  def destroy
  end

  private 

  def job_params
    params.require(:job).permit(:job_description, :date_of_job, :job_complete, :balance_zero, :notes, :date_of_end, :name, :time,:price,:balance)
  end 

end
