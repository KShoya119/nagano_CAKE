Rails.application.routes.draw do
 
  namespace :admin do
  PATCH 'order_details/:id' => 'order_details#update'
  end
 
  namespace :admin do
  PATCH 'orders/:id' => 'public/orders#orders'
  end
 
  namespace :admin do
    get 'orders/:id' => 'orders#show'
  end
  namespace :admin do
    get 'customers' => 'customers#index'
    get 'customers/:id' => 'customers/show'
    get 'customers/:id/edit' => 'customers#edit'
    PATCH 'custmers/:id' => 'custmers/update'
  end
  namespace :admin do
    get 'genres' => 'genres#index'
    POST 'genres' => 'genres#create'
    get 'genres/:id/edit' => 'genres#edit'
    PATCH 'genres/:id' => 'genres#update'
  end
  namespace :admin do
    get 'items'
    get 'items/new'
    POST 'items' => 'items#create'
    get 'items/:id' => 'items#show'
    get 'items/:id/edit' => 'items/edit'
    PATCH 'items/:id' => 'items#update'
  end
  namespace :admin do
    root to: 'homes#top'
  end


  root to: 'public/homes#top'
  get 'homes/about' => 'public/homes#about'
  
  get '/items' => 'public/items#index'
  get '/items/:id' => 'public/items#show'
  
  get 'customers/mypage' => 'public/customers#show'
  get 'customers/edit' => 'public/customers#edit'
  PATCH 'customers' => 'public/customers#update'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  PATCH 'customers/withdrawal' => 'public/customers#withdrawal'
  
  get 'cart_items' => 'public/cort_items#index'
  PATCH 'cart_items/:id' => 'public/cort_items#update'
  DELETE 'cart_items/:id' => 'public/cort_items#destroy'
  DELETE 'cart_items/destroy_all' => 'public/cort_items#destroy_all'
  POST 'cart_items' => 'public/cort_items#create'
  
  get 'orders/new' => 'public/orders#new'
  POST 'orders/confirm' => 'public/orders#confirm'
  get 'orders/complete' => 'public/orders#complete'
  POST 'orders/' => 'public/orders#create'
  get 'orders/index' => 'public/orders#index'
  get 'orders/:id' => 'public/orders#show'
  
  get 'addresses/index' => 'public/addresses#index'
  get 'addresses/:id/edit' => 'public/addresses#edit'
  POST 'addresses' => 'public/addresses#create'
  PATCH 'addresses/:id' => 'public/addresses#update'
  DELETE 'addresses/:id' => 'public/addresses#destroy'
  
  devise_for :customers, controllers: {
  sessions:      'public/customers/sessions',
  passwords:     'public/customers/passwords',
  registrations: 'public/customers/registrations'
  }
  devise_for :admins, controllers: {
  sessions:      'admin/admins/sessions',
  passwords:     'admin/admins/passwords',
  registrations: 'admin/admins/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
