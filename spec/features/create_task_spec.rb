require 'rails_helper'

describe 'Creating a task' do
  it 'creates a task and shows it in the undone list' do
    task_description = 'hello world'

    visit tasks_path

    fill_in 'description', with: task_description
    click_button 'Create task'

    expect(page).to have_content(task_description)
  end
end