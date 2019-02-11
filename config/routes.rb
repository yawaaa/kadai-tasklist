Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # get 'users/index'

  # get 'users/show'

  # get 'users/new'

  # get 'users/create'

  # これが無いと / が/tasks へルーティングされないっぽい
  root to: "tasks#index"
  
  #  URLを/signupにするためだけ
  get "login", to: "session#new"
  post "login", to: "session#new"
  delete "logout", to: "sessios#new"


  get "signup", to: "user#new"

  # テンプレ 
  # TASK CRUD操作用
  resources :tasks
  # user CRUD操作用。ただしeditとかは今回は作らない。
  resources :users, only: [:index, :show, :new, :create]

end
