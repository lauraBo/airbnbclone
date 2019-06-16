Rails.application.routes.draw do
  
  get 'pages/home'
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :rooms, except: [:edit] do
  member do
    get 'listing'
    get 'pricing'
    get 'description'
    get 'amenities'
    get 'photo_upload'
    get 'location'
  end
  resources :photos, only: [:create, :destroy]
  resources :reservations, only: [:create]
end 

end

