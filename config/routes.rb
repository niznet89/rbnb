Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :artworks
  resources :users, only: [:artists]
  resources :commissions, only: [:new, :create]
  resources :services, only: [:create, :update, :edit]

  delete '/services/:id', to: 'services#destroy', as: 'delete_service'
  get 'artists/:id', to: 'users#artists', as: 'artists'
  get 'artists/:id/edit', to: 'users#edit', as: 'edit_profile'
  get '/digital_art', to: 'artworkss#digital_art', as: 'digital_art'
  get '/paintings', to: 'artworks#paintings', as: 'paintings'
  get '/sculptures', to: 'artworks#sculptures', as: 'sculptures'
  get '/thanks', to: 'users#thanks', as: 'thanks'
  get 'my_bookings', to: 'users#my_bookings', as: 'my_bookings'

  # get 'services', to: 'services#show', as: 'artist_services'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
