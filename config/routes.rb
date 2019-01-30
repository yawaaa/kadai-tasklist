Rails.application.routes.draw do

  # これが無いと / が/tasks へルーティングされないっぽい
  root to: "tasks#index"
  
  # テンプレ 
  resources :tasks


end
