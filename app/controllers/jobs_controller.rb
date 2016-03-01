class JobsController < ApplicationController
  def create
    @user = current_user
    @client = Client.find(params[:client_id])
    @job = @client.jobs.build(job_params)
    @job.user_id = @user.id
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
    @user = current_user
    @client = Client.find(params[:client_id])
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:notice] = "Job Updated"
      redirect_to client_job_path(@client,@job)
    else
      flash[:notice] = "Unable to updat Job"
      redirect_to client_job_path(@client,@job)
    end 
  end

  def new 

  end

  def show
    @client = Client.find(params[:client_id])
    @job = Job.find(params[:id])
    @jobitem = Jobitem.new
    @jobitems = Jobitem.where(job_id: @job.id)
    @total_itemized = 0
      @jobitems.each do |e|
        @total_itemized = @total_itemized + e.price
      end 
    @expense = Expense.new
    @expenses = Expense.where(job_id: @job.id)
    @total_expenses = 0
      @expenses.each do |e|
        @total_expenses = @total_expenses + e.amount
      end
    @payment = Payment.new
    @payments = Payment.where(job_id: @job.id).order('date ASC')
    @total_payments = 0
      @payments.each do |e|
        @total_payments = @total_payments + e.amount
      end

    respond_to do |format|
      format.html
      format.js
      format.pdf do
        render :pdf => 'Invoice',
        :template => 'jobs/show.pdf.erb',
        :layout => 'pdf.html.erb'
      end
    end
  end

  def send_pdf
    @user = current_user
    @client = Client.find(params[:client_id])
    @job = Job.find(params[:id])
    pdf = render_to_string :pdf => "Invoice",
        :template => 'jobs/show.pdf.erb',
        :layout => 'pdf.html.erb'
    JobPdf.pdf_email(pdf,@user,@client,@job).deliver_now
    flash[:notice] = "Email sent to #{@client.email}."
    redirect_to client_job_path(@client,@job)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = "Job Removed."
    redirect_to user_path(current_user)
  end

  private 

  def job_params
    params.require(:job).permit(:job_description, :date_of_job, :job_complete, :balance_zero, :notes, :date_of_end, :name, :time,:price,:balance)
  end 

end
