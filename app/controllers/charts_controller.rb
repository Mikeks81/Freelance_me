class ChartsController < ApplicationController
  def index
  end

  def data
  	@user = current_user
  	@userJobs = @user.jobs
  	# @userClients = @user.clients 
  	userjobs = @userJobs.as_json
  	# userclients = @userClients.as_json
  	respond_to do |format|
  		format.json {
  			render :json =>userjobs
  		}
  	end 
  end

end
