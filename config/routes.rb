Rails.application.routes.draw do
  resources :movies
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]

 # get '/movies', to: 'pages#movies'

 # get '/lists', to: 'lists#lists'

 # get 'lists/new', to: 'lists#new_list'
end
