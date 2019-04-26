class GamesController < InheritedResources::Base

  actions :destroy, :show

  before_action :authenticate_user!

  def choose_players
    @game = Game.find(params[:id])
    @players = Player.active.sorted_by_first_name
    render :action => :new
  end

  def create
    params.permit!
    @game = Game.new(params[:game])
    @game.players = Player.find(params[:player_ids]) if params[:player_ids]
    if @game.save
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
    @season = (params[:season_id].nil?) ? Season.last : Season.find(params[:season_id])
    @matches = @season.matches
  end

  def new
    @game = Game.new
    @players = Player.all.order('first_name, last_name')
    # @players = Player.active.sorted_by_first_name
  end

  def update
    params.permit!
    @game = Game.find(params[:id])

    if params[:results]
      @game.results.clear
      params[:results].each do |result|
        @game.results.create(place: result[0], player: Player.find(result[1]["player_id"]))
      end
    end

    if params[:game]
      if @game.update_attributes(params[:game])
        flash[:notice] = "Game was successfully updated!"
        redirect_to :action => :show, :id => @game and return
      else
        render :action => :edit and return
      end
    end
    super
  end

end
