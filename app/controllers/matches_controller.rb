class MatchesController < InheritedResources::Base

  actions :create, :destroy, :edit, :new, :show, :update
  before_action :authenticate_user!

  def create
    params.permit!
    super do |format|
      format.html {redirect_to :controller => :seasons, :action => :show, :id => Season.last}
    end
  end

  def index
    @season = (params[:season_id].nil?) ? Season.last : Season.find(params["season_id"])
    @matches = @season.matches
  end

  def new_game
    @match = Match.find(params[:id])
    @game = @match.games.build
    @players = Player.all.sort {|a, b| a.full_name <=> b.full_name}
  end

  def update
    params.permit!
    super
  end

end
