Rails.application.routes.draw do
  root 'boards#index'
  
  resources :boards do
    resources :cards
  end

  resources :cards do 
    resources :chores
  end

  resources :chores

end
