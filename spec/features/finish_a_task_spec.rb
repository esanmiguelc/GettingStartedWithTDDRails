require 'rails_helper'

describe 'finishing a task' do
  it 'marks a task as done' do
    task = Task.create(description: 'task description')
    visit undone_list_path
    click_button 'complete task'
    expect(page).to_not have_content(task.description)
  end
end