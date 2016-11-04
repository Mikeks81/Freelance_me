class ExpensesController < ApplicationController
  def create
    @user = current_user
    @client = Client.find(params[:client_id])
    @job = Job.find(params[:job_id])
    @expenses = Expense.where(job_id: @job.id)
  	@expense = @job.expenses.build(expense_params)
    @expense.user_id = @user.id

    respond_to do |format|
    	if @expense.save
        @tot_expense = convert_bigD_to_string(Job.job_total_expenses(@job.id))
        @job_revenue = convert_bigD_to_string(Job.job_current_revenue(@job.id))
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
    @expense = Expense.find(params[:id])

    respond_to do |format|
      if @expense.destroy
        @tot_expense = convert_bigD_to_string(Job.job_total_expenses(@job.id))
        @job_revenue = convert_bigD_to_string(Job.job_current_revenue(@job.id))
        format.html { redirect_to client_job_path(@client,@job)}
        format.js
      end
    end
    
  end

  private

  def expense_params
    params.require(:expense).permit(:date,:amount,:description)
  end
end
