Rails.application.routes.draw do
  get '/todos' => 'task#index', as: 'undone_list'
  post '/complete_task' => 'task#complete_task', as: 'complete_task'
  post '/create_task' => 'task#create_task', as: 'create_task'
end
