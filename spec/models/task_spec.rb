require 'active_record_spec_helper'
require './app/models/task'

describe Task do

  let(:task_description) { 'some description' }
  let(:valid_task) { described_class.create!(description: task_description) }

  it 'creates a task' do
    expect { valid_task }.to change { described_class.all.count }.by(1)
  end

  it 'has a description' do
    expect(valid_task.description).to eq(task_description)
  end

  it 'has an initial status of undone' do
    expect(valid_task.status).to eq(described_class::UNDONE)
  end

  it 'is not valid without a description' do
    task = described_class.new
    expect(task).not_to be_valid
  end
end