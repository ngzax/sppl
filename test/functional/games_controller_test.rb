require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  
  setup do
    @game = Factory(:game)
    @match = Factory(:match)
    @game.match_id = @match.id
    @game.save
  end
  
  context "When showing ALL the Games in HTML" do
    setup do
      get :index
    end
  
    should "use the index template" do
      assert_response :success
      assert_template :index
    end

    should "have a Games collection representing all the Games" do
      assert_not_nil assigns(:games)
    end

    should "provide a link to add a new Game" do
      assert_tag :tag => "a", :content => "Add a New Game", :attributes => {:href => new_game_path}
    end

    should "Correctly display the Header" do
      assert_select "h1", "Showing All Games"
    end

    should "Use Game Date as Headers" do
      assert_select "table tr th", "Game Date"
    end

    should "Properly display the Game's Name, Start Year, and Stop Year" do
      assert_select "table tr td", "#{@game.match_date}"
    end
  end

  context "When showing a single Game" do
    setup do
      get :show, :id => @game.to_param
      assert_response :success
    end

    should "use the show template" do
      assert_template :show
    end
    
    should "display a link back to the associated Season" do
      assert_select "a", @game.season.name
    end
  end

  # -------------------------------------------------------------------
  # New
  # -------------------------------------------------------------------
  context "When showing the form to create a New Game" do
    setup do
      get :new
    end

    should "be displayed using the new template" do
      assert_response :success
    end
    
    should "Correctly display the Header" do
      assert_select "h1", "Creating a New Game"
    end

    should "Show that we can enter Ordinal, Start Year, and Stop Year" do
      assert_select "table tr th", "Game date"
    end

    should "show a dropdown to associate the Game with a Season" do
      assert_select "table tr th", "Season"
      assert_select "table tr td select[id='game_season_id']"
    end
  end

  context "When creating a Game" do
    should "be able to create a Game" do
      assert_difference('Game.count') do
        post :create, :game => @game.attributes
      end
      assert_redirected_to game_path(assigns(:game))
    end
  end

  context "When editing a Game" do
    setup do
      get :edit, :id => @game.to_param
    end

    should "display the edit form" do
      assert_response :success
    end

    should "use the edit template" do
      assert_template :edit
    end

    should "redirect to the show view after a successful edit" do
      put :update, :id => @game.to_param, :game => @game.attributes
      assert_redirected_to game_path(assigns(:game))
    end
  end

  context "When removing a Game" do
    should "be able to destroy a Game" do
      assert_difference('Game.count', -1) do
        delete :destroy, :id => @game.to_param
      end
    end

    should "be redirected back to the display of all Games" do
      delete :destroy, :id => @game.to_param
      assert_redirected_to games_path
    end
  end

end
