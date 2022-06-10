Rails.application.routes.draw do
  resources :beneficiaries
  resources :dependents
  devise_for :users
  resources :users
  resources :occupations
  resources :insureds do 
    collection { post :import }
  end
  resources :cooperative_branches
  resources :cooperatives do 
    get :selected, on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cooperatives#index"
end
