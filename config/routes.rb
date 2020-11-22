Rails.application.routes.draw do

  root 'tweets#index'  


  #get 'tweets/new'
  #get 'tweets/index'
  #get 'tweets/show'
  #get 'tweets/create'
  #get 'users/index'
  #get 'users/show'


  devise_for :users
  resources :tweets 
  resources :users 
 
end
