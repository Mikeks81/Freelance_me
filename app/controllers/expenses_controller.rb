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
        format.html {redirect_to client_job_path(@client,@job)}
    		format.js 
        # flash[:notice] = "Expense Added"
        # redirect_to client_job_path(@client,@job)
    	else
    		format.html {redirect_to client_job_path(@client,@job)}
        # flash[:notice] = "Expense could not be added"
        # redirect_to client_job_path(@client,@job)
    	end
    end
  end	

  def update
  
  end

  def destroy
    @client = Client.find(params[:client_id])
    @job = Job.find(params[:job_id])
    @expense = Expense.find(params[:id])
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to client_job_path(@client,@job)}
      format.js
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:date,:amount,:description)
  end
end
