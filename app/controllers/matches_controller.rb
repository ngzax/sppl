class MatchesController < InheritedResources::Base
  actions :create, :destroy, :edit, :index, :new, :show, :update
  before_filter :require_user
  
  def new_game
    @match = Match.find(params[:id])
    @game = @match.games.build
    @players = Player.all
  end

end
