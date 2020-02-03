Rails.application.routes.draw do
 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "home/main"
  root "home#main"
  resources :posts do
    member do
      post :toggle_like
    end
  end
end
