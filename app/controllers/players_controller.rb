class PlayersController < InheritedResources::Base
  actions :create, :destroy, :edit, :new, :show, :update
  
  def index
    @page_title = "All Players"
    @players = Player.all.sort.reverse
  end

  def move
    if ["move_lower", "move_higher"].include?(params[:method]) and params[:game_player_id] =~ /^\d+$/
      gp = Result.find(params[:game_player_id])
      gp.send(params[:method]) unless gp.nil?
    end
    redirect_to :controller => :games, :action => :show, :id => gp.game.id
  end

  def show
    show! { @page_title = "Showing a Player" }
  end

end
