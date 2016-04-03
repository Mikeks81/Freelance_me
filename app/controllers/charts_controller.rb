class ChartsController < ApplicationController
  def index
    @clients = current_user.clients
    @jobs = current_user.jobs
    @expenses = current_user.expenses
    @payments = current_user.payments
  
    @ytd_totalgross = current_user.current_year_gross_income

    @ytd_highest_price_job = current_user.highest_price_job

    @ytd_totalpayments = current_user.ytd_tot_payments

    @ytd_totalrevenue = current_user.ytd_revenue

    @ytd_totalpaymentdue = current_user.current_year_gross_income - current_user.ytd_tot_payments

    @ytd_paymentrecievedpercent = (current_user.ytd_tot_payments.to_f/current_user.current_year_gross_income.to_f)*100
    
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

  def num_of_jobs
    @user = current_user
    @userJobs = @user.jobs.order('created_at ASC')
    @userJobs = @userJobs.group_by {|t| t.date_of_job.beginning_of_month.month}
    userjobnum = @userJobs.as_json
    respond_to do |format|
      format.json {
        render :json =>userjobnum
      }
    end
  end

end
