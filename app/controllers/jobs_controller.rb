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
      flash[:notice] = "#{@job.errors.full_messages.first}"
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
      flash[:notice] = "#{@job.errors.full_messages.first}"
      redirect_to client_job_path(@client,@job)
    end 
  end

  def new 

  end

  def show
    @user = current_user
    @client = Client.find(params[:client_id])

    @job = Job.find(params[:id])
    @job_current_balance = Job.job_current_balance(@job.id)

    @jobitem = Jobitem.new
    @jobitems = Jobitem.where(job_id: @job.id)
    @total_itemized = Jobitem.jobitem_tot_price(@job.id)
     
    @expense = Expense.new
    @expenses = Expense.where(job_id: @job.id).order('date ASC')
    @total_expenses = Job.job_total_expenses(@job.id)
    @job_current_revenue = Job.job_current_revenue(@job.id)
      
    @payment = Payment.new
    @payments = Payment.where(job_id: @job.id).order('date ASC')
    @total_payments = Job.job_total_payments(@job.id)

    respond_to do |format|
      format.html
      format.json {
        render json: {current_balance: @job_current_balance, current_revenue: @job_current_revenue,
          tot_expenses: @total_expenses,
          tot_payments: @total_payments
         }
      }
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
    @jobitems = Jobitem.where(job_id: @job.id)
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
