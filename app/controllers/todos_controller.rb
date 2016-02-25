class TodosController < ApplicationController
  def index
  	@user = current_user
  	@todo = Todo.new
  	@date = Date.today
  	# @d = @d.strftime("%B%e%Y")
  	@todos = Todo.all.last
  end
  
  def create
  	@user = current_user
  	@todo = @user.todos.build(todo_params)
  	if @todo.save
  		flash[:notice] = "Task added"
  		redirect_to todos_path
  	else
  		flash[:notice] = "#{errors.full_messages.first}"
  		redirect_to todos_path
  	end
  end
  
  def show
  
  end

  def destroy
  
  end

  private

  def todo_params
  	params.require(:todo).permit(:item, :date)
  end
end
