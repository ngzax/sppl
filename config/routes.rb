Sppl::Application.routes.draw do
  resources :games
  resources :matches
  resources :players
  resources :seasons

  root :to => "seasons#index"
end
