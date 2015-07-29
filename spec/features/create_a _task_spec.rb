require 'rails_helper'

describe 'When something new has to be done' do
  it 'creates a task' do
    visit undone_list_path
    fill_in 'description', with: 'this is a new task'
    click_button 'create new task'
    expect(page).to have_content('this is a new task')
    expect(page).to have_css('.task')
  end
end