Rails.application.routes.draw do
  
  root 'pages#home'
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
 resources :rooms, except: [:edit] do
  member do
    get 'listing'
    get 'pricing'
    get 'description'
    get 'amenities'
    get 'photo_upload'
    get 'location'
    get 'preload'
    get 'preview'
  end

  resources :photos, only: [:create, :destroy]
  resources :reservations, only: [:create]
 end 

  get '/your_trips' => 'reservations#your_trips'
end

