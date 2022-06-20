Rails.application.routes.draw do
 
  namespace :admin do
  #patch 'order_details/:id' => 'order_details#update'
  end
 
  namespace :admin do
  patch 'orders/:id' => 'public/orders#orders'
  end
 
  namespace :admin do
    get 'orders/show' => 'orders#show'
  end
  namespace :admin do
    get 'customers' => 'customers#index'
    get 'customers/:id/show' => 'customers#show', as: "customer_show"
    get 'customers/:id/edit' => 'customers#edit'
    patch 'custmers/:id' => 'custmers#update', as: "update_customer"
  end
  namespace :admin do
    get 'genres' => 'genres#index'
    post 'genres' => 'genres#create'
    get 'genres/:id/edit' => 'genres#edit', as: 'edit_genres'
    patch 'genres/:id' => 'genres#update', as: 'genres_update'
  end
  namespace :admin do
    get 'items' => 'items#index'
    get 'items/new' => 'items#new'
    post 'items' => 'items#create'
    get 'items/:id/show' => 'items#show', as: "items_show"
    get 'items/:id/edit' => 'items#edit', as: "items_edit"
    patch 'items/:id' => 'items#update', as: "update_items"
  end
  namespace :admin do
    root to: 'homes#top'
  end


  root to: 'public/homes#top'
  get 'homes/about' => 'public/homes#about'
  
  get '/items' => 'public/items#index'
  get '/items/show' => 'public/items#show'
  
  get 'customers/mypage' => 'public/customers#show'
  get 'customers/edit' => 'public/customers#edit'
  patch 'customers' => 'public/customers#update'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/withdrawal' => 'public/customers#withdrawal'
  
  get 'cart_items' => 'public/cart_items#index'
  #patch 'cart_items/:id' => 'public/cort_items#update'
  #delete 'cart_items/:id' => 'public/cort_items#destroy'
  #delete 'cart_items/destroy_all' => 'public/cort_items#destroy_all'
  post 'cart_items' => 'public/cort_items#create'
  
  get 'orders/new' => 'public/orders#new'
  post 'orders/confirm' => 'public/orders#confirm'
  get 'orders/complete' => 'public/orders#complete'
  post 'orders/' => 'public/orders#create'
  get 'orders/index' => 'public/orders#index'
  get 'orders/show' => 'public/orders#show'
  
  get 'addresses/index' => 'public/addresses#index'
  get 'addresses/edit' => 'public/addresses#edit'
  post 'addresses' => 'public/addresses#create'
  #patch 'addresses/:id' => 'public/addresses#update'
  #delete 'addresses/:id' => 'public/addresses#destroy'
  
  devise_for :customers, controllers: {
  sessions:      'public/customers/sessions',
  passwords:     'public/customers/passwords',
  registrations: 'public/customers/registrations'
  }
  
  devise_for :admins, controllers: {
  sessions:      'admin/admins/sessions',
  passwords:     'admin/admins/passwords',
  registrations: 'admin/admins/registrations',
  }
  
  namespace :admin do
    devise_for :admins, :path => "/"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
