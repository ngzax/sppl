Sppl::Application.routes.draw do
  resources :games
  resources :matches
  resources :seasons

  root :to => "seasons#index"
end
