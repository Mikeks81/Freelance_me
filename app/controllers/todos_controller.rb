class TodosController < ApplicationController
  def index
  	@user = current_user
  	@todo = Todo.new
  	@date = Date.today
  	@todos = Todo.all
  end
  
  def create
      @date = Date.today
      @todos = Todo.all
  	@todo = current_user.todos.build(todo_params)
  	# respond_to do |format|
	  	if @todo.save
	  		# format.html { redirect_to user_show(current_user), notice: "Task added"}
	  		# format.js
	  		redirect_to user_path(current_user)
	  	else
	  		# format.html { redirect_to user_path(current_user), alert: "Task could not be removed" }
	  		redirect_to user_path(current_user)
	  	end
	  # end
  end
  
  def show
  
  end

  def destroy
  	@todo = Todo.find(params[:id])
		respond_to do |format|
	  	if @todo.destroy
  			format.html {redirect_to user_show(current_user), notice: "Task Removed"}
  			format.js 
  		else
  			format.html { redirect_to user_path(current_user), alert: "Task Could not be Removed" }
  		end 

  	end
  	# flash[:notice] = "Task Removed"
  	# redirect_to user_path(current_user)
  end

  private

  def todo_params
  	params.require(:todo).permit(:item, :date, :completed)
  end
end
