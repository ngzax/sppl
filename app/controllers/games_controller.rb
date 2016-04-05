class GamesController < InheritedResources::Base

  actions :destroy, :show
  before_filter :require_user
 
  def choose_players
    @game = Game.find(params[:id])
    @players = Player.active.sorted_by_first_name
    render :action => :new
  end
  
  def create
    @game = Game.new(params[:game])
    if @game.save
      if params[:player_ids]
        params[:player_ids].each_index do |i|
          Result.create(:game => @game, :player_id => params[:player_ids][i].to_i, :place => i) 
        end
      end
      flash[:notice] = "Game was successfully created!"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def index
    @page_title = "Showing All Games"
    @season = (params[:season_id].nil?) ? Season.find(:last) : Season.find(params["season_id"])
    @matches = @season.matches
  end

  def new
    @game = Game.new
    @players = Player.active.sorted_by_first_name
  end

  def update
    @game = Game.find(params[:id])
    if @game
      if params[:game][:results_attributes]
        params[:game][:results_attributes].each_pair do |k, v|
          r = Result.find(v[:id])
          r.update_attributes(:player_id => v[:player_id].to_i, :place => (k.to_i + 1)) 
        end
      end
      flash[:notice] = "Game was successfully updated!"
      redirect_to :action => :show, :id => @game
    else
      render :action => :edit
    end
  end

end
