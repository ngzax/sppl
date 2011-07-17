class GamePlayersController < InheritedResources::Base
  actions :create, :destroy, :edit, :new, :show, :update

  def index
    @game = Game.find(params[:game_id])
    @players = Player.all
  end

end
