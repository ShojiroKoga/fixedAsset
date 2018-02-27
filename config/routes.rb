Rails.application.routes.draw do
  resources :fixedassets
  resources :fixedassets ,only: :index do
   collection { post :import }
  end 
   
  get 'sessions/new'

  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
  
#  if Rails.env.development?
#  mount LetterOpenerWeb::Engine, at: "/letter_opener"
#  end
  
end