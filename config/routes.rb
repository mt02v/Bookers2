Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => "homes#about"
  post 'books' => "books#create"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :post_images, only: [:new]

end
