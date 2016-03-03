class ChartsController < ApplicationController
  def index
    @user = current_user
    @clients = Client.where(user_id: @user.id)
    @jobs = Job.where(user_id: @user.id)
    @expenses = Expense.where(user_id: @user.id)
    @payments = Payment.where(user_id: @user.id)
    @daterange = Time.now.beginning_of_year..Time.now.end_of_year
    @ytd_totalgross = 0
    @ytd_highest_price_job = 0
    @ytd_h_job_client_id = 0
    @ytd_h_job_id = 0
      @jobs.each do |j|
        if j.date_of_job.year == Time.now.year
          @ytd_totalgross += j.price
          if @ytd_highest_price_job < j.price
              @ytd_highest_price_job = j.price
              @ytd_h_job_client_id = j.client_id
              @ytd_h_job_id = j.id
          end
        end
      end
    @ytd_totalexpenses = 0
      @expenses.each do |e|
        if e.date.year == Time.now.year
          @ytd_totalexpenses += e.amount 
        end
      end
    @ytd_totalpayments = 0
      @payments.each do |p|
        if p.date.year == Time.now.year
          @ytd_totalpayments += p.amount
        end
      end
    @ytd_totalrevenue = @ytd_totalgross - @ytd_totalexpenses
    @ytd_totalpaymentdue = @ytd_totalgross - @ytd_totalpayments
    @ytd_paymentrecievedpercent = (@ytd_totalpayments.to_f/@ytd_totalgross.to_f)*100
    @ytd_totaljobs = 0
      @jobs.each do |j|
        if j.date_of_job.year == Time.now.year
          @ytd_totaljobs += 1
        end
      end
    @ytd_totalclients = 0
      @clients.each do |j|
        if j.created_at.year == Time.now.year
          @ytd_totalclients += 1
        end
      end

  end

  def data
  	@user = current_user
  	@userJobs = @user.jobs.order('created_at ASC')
  	userjobs = @userJobs.as_json
  	respond_to do |format|
  		format.json {
  			render :json =>userjobs
  		}
  	end 
  end

end
