Rails.application.routes.draw do
  get '/tasks' => 'task#index', as: 'tasks'
  post '/create_task' => 'task#create_task', as: 'create_task'
end
