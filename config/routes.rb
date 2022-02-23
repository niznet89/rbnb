Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :artworks
  resources :users, only: [:artists]
  resources :commissions, only: [:new, :create]
  get '/artists/:id', to: 'users#artists', as: 'artists'
  get '/digital_art', to: 'users#digital_art', as: 'digital_art'
  get '/paintings', to: 'users#paintings', as: 'paintings'
  get '/sculptures', to: 'users#sculptures', as: 'sculptures'
  get '/thanks', to: 'users#thanks', as: 'thanks'
  # get 'services', to: 'services#show', as: 'artist_services'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
