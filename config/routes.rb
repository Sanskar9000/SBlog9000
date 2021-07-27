Rails.application.routes.draw do
  root 'pages#home'

  # get 'pages/about'             #this refers to /pages/about
  get 'about', to: 'pages#about'  #this refers to /about

  resources :articles, only: [:show, :index, :new, :create ]
end
