class PaymentsController < ApplicationController
	def create
		@user = current_user
		@client = Client.find(params[:client_id])
	    @job = Job.find(params[:job_id])
	    @payments = Payment.where(job_id: @job.id)
	  	@payment = @job.payments.build(payment_params)
	  	@payment.user_id = @user.id
	  	respond_to do |format|
	  	if @payment.save
	  		@total_payments = convert_bigD_to_string(Job.job_total_payments(@job.id))
	  		@job_balance = convert_bigD_to_string(Job.job_current_balance(@job.id))
	  		format.html {redirect_to client_job_path(@client,@job), notice: "Payemnt Record Added"}
	  		format.js
	  	else
	  		format.html {redirect_to client_job_path(@client,@job), notice: "Payemnt Record Added"}
	  	end
	  end
	end

	def destroy
		@client = Client.find(params[:client_id])
    	@job = Job.find(params[:job_id])
		@payment = Payment.find(params[:id])
		respond_to do |format|
			if @payment.destroy
				@total_payments = convert_bigD_to_string(Job.job_total_payments(@job.id))
				@job_balance = convert_bigD_to_string(Job.job_current_balance(@job.id))
				format.html {redirect_to client_job_path(@client,@job)}
				format.js
			else
				format.html {redirect_to client_job_path(@client,@job)}
			end
		end
	end

	private

		def payment_params
			params.require(:payment).permit(:date,:amount,:form)
		end
end
