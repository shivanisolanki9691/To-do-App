class TodosController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index
		@monday_todos = Todo.where(day: 'Monday')
		@tuesday_todos = Todo.where(day: 'Tuesday')
		@wednesday_todos = Todo.where(day: 'Wednesday')
		@thuesday_todos = Todo.where(day: 'Thuesday')
		@friday_todos = Todo.where(day: 'Friday')
		@saturday_todos = Todo.where(day: 'saturday')		
		@sunday_todos = Todo.where(day: 'sunday')
	end

	def create
		todo = Todo.new(todo_params)
		if todo.save
			render json: @todo
			SendMailer.send_email(todo.email, todo).deliver_now
		else
			render :index
		end
	end

	def show
		@todo = Todo.find(params[:id])
	end

	def destroy
		@todo = Todo.find(params[:id])
		if @todo.destroy
			# render json: @todo
			redirect_to todos_path, notice: "todo was successfully destroyed." 
		end
  	end
	private
	def todo_params
		params.require(:todo).permit(:name, :day, :email, :image)
	end
end
