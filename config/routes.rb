Rails.application.routes.draw do
  
    root "athletes#index"
    
  devise_for :users

  resources :athletes
end
