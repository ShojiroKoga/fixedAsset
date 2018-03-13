Rails.application.routes.draw do
  resources :fixedassets
  resources :fixedassets ,only: :index do
   collection { post :import }
  end 
   
  get 'sessions/new'


  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
  
#  if Rails.env.development?
#  mount LetterOpenerWeb::Engine, at: "/letter_opener"
#  end


root :to => 'fixedassets#index'
  
end