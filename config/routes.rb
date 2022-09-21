Rails.application.routes.draw do
 
  root to: "homes#top"
  get "home/about" => "homes#about", as: 'about'
  
  devise_for:users,skip: [:passwords],controllers:{
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }
  
  devise_for:admin, skip: [:registrations, :passwords] ,controllers:{
    sessions: "admin/sessions"
  }
  
  resources :users, only:[:show, :edit, :update]
  
  resources :items, only:[:index, :show]
  
  resources :cart_items, only:[:index, :create, :update, :destroy] do
    collection do
      delete :destroy_all
    end
  end
  
  resources :orders, only:[:new, :index, :create, :show] do
    collection do
      get   :confirm
      patch :complete
    end
  end
  
  resources :genres, only:[:show]
  
  
  namespace :admin do
    
    root to: 'homes#top'
    
    resources :items
    
    resources :genres, only:[:create, :index, :edit, :update]
    
    resources :users, only:[:index, :show, :edit, :update]
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
