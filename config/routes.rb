Sppl::Application.routes.draw do
  
  resources :games do
    member do
      get :choose_players
    end
  end

  resources :matches do
    member do
      get :new_game
    end
  end
  
  resources :players

  resources :seasons do
    member do
      get :new_match
    end
  end

  root :to => "seasons#index"
end
