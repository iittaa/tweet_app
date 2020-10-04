Rails.application.routes.draw do  
  post 'comments/:id/update' => 'comments#update'
  get 'comments/:id/reply' => 'comments#reply'
  post 'comments/:id/create' => 'comments#create'
  get 'comments/:id/new' => 'comments#new'

  post 'relationship/:id/create' => 'relationship#create'
  post 'relationship/:id/destroy' => 'relationship#destroy'
  
  post 'like/:id/destroy' => 'like#destroy'
  post 'like/:id/create' => 'like#create'

  get 'user/:id/followers' => 'user#followers'
  get 'user/:id/following' => 'user#following'
  get 'user/:id/like' => 'user#like'
  post 'user/logout' => 'user#logout'
  post 'user/:id/update' => 'user#update'
  get 'user/:id/edit' => 'user#edit'
  get 'user/:id/show' => 'user#show'
  post 'user/create' => 'user#create'
  get 'user/new' => 'user#new'
  post 'user/login_form' => 'user#login_form'
  get 'user/login' => 'user#login'
  get 'user/index' => 'user#index'
  
  get 'post/new' => 'post#new'
  get 'post/index' => 'post#index'
  get 'post/:id/show' => 'post#show'
  post 'post/create' => 'post#create'
  get 'post/:id/edit' => 'post#edit'
  post 'post/:id/update' => 'post#update'
  post 'post/:id/destroy' => 'post#destroy'
  
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
