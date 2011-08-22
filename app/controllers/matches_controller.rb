class MatchesController < InheritedResources::Base
  actions :create, :destroy, :edit, :index, :new, :show, :update
  
  def new_game
    @match = Match.find(params[:id])
    @game = @match.games.build
    @players = Player.all
  end

end
