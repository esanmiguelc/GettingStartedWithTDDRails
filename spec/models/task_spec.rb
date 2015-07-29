require 'active_record_spec_helper'
require './app/models/task'

describe Task do
  it 'creates a new task' do
    expect { Task.create!(description: 'description') }.to change { Task.all.size }.by(1)
  end

  it 'is not valid without a description' do
    task = Task.new
    expect(task).to_not be_valid
  end

  it 'has a description' do
    description = 'description'
    task = Task.new(description: description)
    expect(task.description).to eq(description)
  end

  it 'has a status of undone when created' do
    task = Task.create!(description: 'undone task')
    expect(task.status).to eq('undone')
  end

  it 'updates a task to done' do
    task = Task.create!(description: 'task to be finished')
    task.update!(status: 'done')
    expect(task.status).to eq('done')
  end
end