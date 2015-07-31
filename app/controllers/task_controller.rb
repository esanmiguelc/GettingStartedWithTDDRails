class TaskController < ApplicationController

  def index
    @tasks = Task.where(status: Task::UNDONE)
  end

  def create_task
    Task.create!(description: params[:description])
    redirect_to(tasks_path)
  end
end