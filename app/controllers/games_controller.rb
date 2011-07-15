class GamesController < InheritedResources::Base
  actions :create, :destroy, :edit, :index, :new, :show, :update
  
  def choose_players
    @game = Game.find(params[:id])
  end

end
