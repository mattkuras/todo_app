class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def index
    @todos = current_user.todos
  end
end
