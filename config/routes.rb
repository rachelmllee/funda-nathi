Rails.application.routes.draw do
  get 'opportunities/index'

  devise_for :admins, :skip => [:registrations, :passwords, :confirmations]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :webinars
  resources :chat_messages
  resources :chats

  get "/get_chat.json" => "chats#get_chat"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  
  root 'home#index'

  get "/courses/search" => "courses#search"

  get "/courses/admin" => "courses#admin"

  get 'account' => "accounts#show"

  get '/account/payment' => "accounts#edit"
  
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end

  resources :opps

  resources :accounts

  resources :messages, only: [:new, :create]

  resources :users, only: [:index]

  resources :courses do
    resources :documents
  end

  resources :courses do
    resources :videos
  end

end
