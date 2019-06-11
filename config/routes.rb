Rails.application.routes.draw do
  get 'room/index'
  get 'room/new'
  get 'room/create'
  get 'room/listing'
  get 'room/pricing'
  get 'room/description'
  get 'room/photo_upload'
  get 'room/amenities'
  get 'room/location'
  get 'room/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :pages

end

