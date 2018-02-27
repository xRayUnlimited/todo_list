Rails.application.routes.draw do
  get 'todos/index'

  get 'todos/show'

  get 'todos/new'

  root 'todos#home'

  resources :todos
end
