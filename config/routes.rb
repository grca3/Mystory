Rails.application.routes.draw do
  resources :blogs
  root 'home#top' #トップページをhomeコントローラのtopのアクションに設定
  # resources :posts, only: [:destroy]
  get "users/signup" => "users#new"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
  
  get "login" => "users#login_form"
  post "login" => "users#login"

  post "logout" => "users#logout"
  get "logout" => "users#logout"
  # get 'users'
  
  get "posts/personal" => "posts#personal"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "posts/:id/destroy" => "posts#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#top"

  get "/about" => "home#about"
  
end
