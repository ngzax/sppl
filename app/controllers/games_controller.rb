class GamesController < InheritedResources::Base
  actions :create, :destroy, :edit, :index, :new, :show, :update
end
