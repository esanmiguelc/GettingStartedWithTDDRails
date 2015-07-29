describe 'listing undone tasks' do
  it 'displays the task description' do
    task = Task.create!(description: 'some description')
    visit undone_list_path
    expect(page).to have_content(task.description)
  end
end