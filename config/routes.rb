Rails.application.routes.draw do
  root to: "homes#top"
  get '/home/about' => "homees#about"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :post_images, only: []

end
