class TaskController < ApplicationController

  def index
    @todos = Task.where(status: 'undone')
  end

  def complete_task
    task = Task.find_by_id(params[:id])
    task.status = 'done'
    task.save!
    redirect_to_list
  end

  def create_task
    Task.create!(description: params[:description])
    redirect_to_list
  end

  private

  def redirect_to_list
    redirect_to(undone_list_path)
  end
end