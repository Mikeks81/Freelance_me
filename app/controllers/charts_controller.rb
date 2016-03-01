class ChartsController < ApplicationController
  def index
  end

  def data
  	@user = current_user
  	@userJobs = @user.jobs 
  	userjson = @userJobs.as_json
  	respond_to do |format|
  		format.json {
  			render :json =>userjson
  		}
  	end 
  end

end
