Rails.application.routes.draw do
  namespace :v1 do
    get 'v1_home', to:'pages#home',  as: 'home'
    get 'pages/about'
    get 'pages/contact'
    get 'pages/:dynamic', to: 'pages#dynamic'
    get "pages/*missing", to: "pages#missing"
  end
  namespace :admin do
    get 'dashboard_main', to: 'dashboard#main', as: 'main'
    get 'dashboard/user'
    get 'dashboard/blog'
  end
  get 'posts/home'
  get 'posts/abot'
  get 'posts/contact'
  get 'todos/home'
  get 'todos/about'
  get 'todos/contact'
  get 'show', to: 'pages#show'
  root "pages#index"
  # get "v1/pages/*missing", to: "v1/pages#missing"
end
