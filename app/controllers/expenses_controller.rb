class ExpensesController < ApplicationController
  def create
    @client = Client.find(params[:client_id])
    @job = Job.find(params[:job_id])
  	@expense = @job.expenses.build(expense_params)
    @expenses = Expense.where(job_id: @job.id)
    respond_to do |format|
    	if @expense.save
        format.html {redirect_to client_job_path(@client,@job), notice: "Expense Added"}
    		format.js 
        # flash[:notice] = "Expense Added"
        # redirect_to client_job_path(@client,@job)
    	else
    		format.html {format.html {redirect_to client_job_path(@client,@job), notice: "Expense could not be added"}}
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
    flash[:notice] = "Expense Removed"
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
