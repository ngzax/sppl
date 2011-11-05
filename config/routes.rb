Sppl::Application.routes.draw do
  
  resources :users

  resources :games do
    member do
      get :choose_players
    end
  end

  resources :game_players

  resources :matches do
    member do
      get :new_game
    end
  end
  
  resources :players do
    member do
      get :move
    end
  end

  resources :seasons do
    member do
      get :new_match
    end
  end

  root :to => "players#index"
end
