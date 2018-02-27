class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todos_params)
    if @todo.save
      redirect_to todos_path
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todos_params)
      redirect_to todos_path
    else
      render :edit
    end
  end

  def destroy
    Todo.find(params[:id]).destroy
    redirect_to todos_path
  end

  private

  def todos_params
    params.require(:todo).permit(:title, :description, :importance, :completed)
  end
end
