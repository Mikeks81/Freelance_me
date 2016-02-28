class PaymentsController < ApplicationController
	def create
		@client = Client.find(params[:client_id])
    @job = Job.find(params[:job_id])
  	@payment = @job.payments.build(payment_params)
  	if @payment.save
  		flash[:notice] = "Payemnt Record Added"
  		redirect_to client_job_path(@client,@job)
  	else
  		flash[:notice] = "Payemnt Record could not be added"
  		redirect_to client_job_path(@client,@job)
  	end
	end

	def destroy
		@client = Client.find(params[:client_id])
    @job = Job.find(params[:job_id])
		@payment = Payment.find(params[:id])
		@payment.destroy
		flash[:notice] = "Payment Removed"
		redirect_to client_job_path(@client,@job)
	end

	private

		def payment_params
			params.require(:payment).permit(:date,:amount,:form)
		end
end
