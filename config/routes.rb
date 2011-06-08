Sppl::Application.routes.draw do
  
  resources :games
  resources :matches
  resources :players

  resources :seasons do
    member do
      get :new_match
    end
  end

  root :to => "seasons#index"
end
