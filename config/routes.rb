FatLossPro::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  resources :articles
  resources :weights, only: ['create']
  resources :notes, only: ['create','destroy']
  
  root 'articles#index'
  get '/articles/page/(:page)' => 'articles#index'
  get 'dashboard' => 'dashboard#index', as: :user_root
  get 'dashboard/weight' => 'weights#index', as: :weight_tracker
  get 'dashboard/notes/(:page)' => 'notes#index', as: :user_notes
  
  get '/:name' => 'pages#show'

end
