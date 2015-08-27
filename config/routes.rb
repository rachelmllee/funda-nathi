Rails.application.routes.draw do
  devise_for :admins, :skip => [:registrations, :passwords, :confirmations]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :webinars
  resources :chat_messages
  resources :chats

  get "/get_chat.json" => "chats#get_chat"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'home#index'

  get "/courses/search" => "courses#search"

  get "/courses/admin" => "courses#admin"
  
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

  resources :messages, only: [:new, :create]

  resources :users, only: [:index]

  resources :courses do
    resources :documents
  end

  resources :courses do
    resources :videos
  end



end
