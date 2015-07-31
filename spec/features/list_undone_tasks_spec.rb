require 'rails_helper'

describe 'Listing all the undone tasks' do
  it 'displays the description of a task' do
    task = create_task(description: 'Hello world')

    visit tasks_path

    expect(page).to have_content(task.description)
  end

  it 'displays the description of all the tasks' do
    task1 = create_task(description: 'Hello world')
    task2 = create_task(description: 'Good bye')

    visit tasks_path

    expect(page).to have_content(task1.description)
    expect(page).to have_content(task2.description)
  end

  def create_task(description:)
    Task.create!(description: description)
  end
end