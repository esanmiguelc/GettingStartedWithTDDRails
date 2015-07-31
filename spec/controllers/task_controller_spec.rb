require 'rails_helper'

describe TaskController do
  let(:task_params) { {description: 'Hello World'} }
  it 'has a page with all the undone tasks' do
    get :index
    expect(response).to be_ok
  end

  it 'gets all the undone tasks' do
    task = instance_double('Task')
    tasks = [task]
    expect(Task).to receive(:where).with(status: Task::UNDONE).and_return(tasks)

    get :index

    expect(assigns(:tasks)).to eq(tasks)
  end

  it 'creates a task' do
    expect(Task).to receive(:create!).with(task_params)

    post :create_task, task_params

  end

  it 'redirects back to the task list' do
    allow(Task).to receive(:create!).with(task_params)

    post :create_task, task_params

    expect(response).to redirect_to(tasks_path)
  end
end