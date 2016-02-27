class ExpensesController < ApplicationController
  def create
    @client = Client.find(params[:client_id])
    @job = Job.find(params[:job_id])
  	@expense = @job.expenses.build(expense_params)
  	if @expense.save
  		flash[:notice] = "Expense Added"
  		redirect_to client_job_path(@client,@job)
  	else
  		flash[:notice] = "#{errors.full_messages.first}"
  		redirect_to client_job_path(@client,@job)
  	end
  end	

  def update
  
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    flash[:notice] = "Expense Removed"
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:date,:amount,:description)
  end
end
