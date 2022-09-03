Rails.application.routes.draw do
  root to: "homes#top"
  get "home/about" => "homes#about", as: 'about'
  
  devise_for:users,controllers:{
    registrations: "registrations",
    sessions: 'sessions'
  }
  
  devise_for:admin,controllers:{
    sessions: "admin/sessions"
  }
  
  resources :users, only:[:show, :edit, :update]
  
  resources :items, only:[:index, :show]
  
  resources :cart_items, only:[:index, :create, :update, :destroy] do
    collection do
      delete :destroy_all
    end
  end
  
  resources :order, only:[:new, :index, :create, :show] do
    collection do
      get   :confrim
      patch :complete
    end
  end
  
  resources :genres, only:[:show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
