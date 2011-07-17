require 'test_helper'

class GamePlayersControllerTest < ActionController::TestCase
  
  setup do
    @game = Factory(:game)
    @p = Factory(:player)
    @game.players << @p
    @game.save
  end
  
  # -------------------------------------------------------------------
  # Index
  # -------------------------------------------------------------------
  context "When showing ALL the GamePlayers for a Game in HTML" do
    setup do
      get :index, :game_id => @game.id
    end
  
    should "use the index template" do
      assert_response :success
      assert_template :index
    end
#
#    should "have a GamePlayers collection representing all the GamePlayers" do
#      assert_not_nil assigns(:games)
#    end
#
#    should "provide a link to add a new GamePlayer" do
#      assert_tag :tag => "a", :content => "Add a New GamePlayer", :attributes => {:href => new_game_path}
#    end
#
#    should "Correctly display the Header" do
#      assert_select "h1", "Showing All GamePlayers"
#    end
#
#    should "Use GamePlayer # as a Header" do
#      assert_select "table tr th", "GamePlayer #"
#    end
#
#    should "Properly display the GamePlayer's Ordinal" do
#      assert_select "table tr td", "#{@game.ordinal}"
#    end
  end

  # -------------------------------------------------------------------
  # Show
  # -------------------------------------------------------------------
#  context "When showing a single GamePlayer" do
#    setup do
#      @p = Factory(:player)
#      @game.players << @p
#      get :show, :id => @game.to_param
#      assert_response :success
#    end
#
#    should "use the show template" do
#      assert_template :show
#    end
#    
#    should "display a link back to the associated Match" do
#      assert_select "a", "#{@game.match.match_date}"
#    end
#    
#    should "display a list of links to all associated Players in the row detail" do
#      assert_select "td a", "#{@p}"
#    end
#
#    should "display an Actions Section with a link to add a New Player" do
#      assert_select "th", "Actions"
#      assert_select "td a", "Choose Players"
#    end
#  end
#
#  context "When showing a single GamePlayer without associated Players" do
#    should "display the italic word 'None' if there are no Associated Players" do
#      get :show, :id => @game.to_param
#      assert_select "td i", "None"
#    end
#  end

  # -------------------------------------------------------------------
  # New
  # -------------------------------------------------------------------
#  context "When showing the form to create a New GamePlayer" do
#    setup do
#      get :new
#    end
#
#    should "be displayed using the new template" do
#      assert_response :success
#    end
#    
#    should "Correctly display the Header" do
#      assert_select "h1", "Creating a New GamePlayer"
#    end
#
#    should "Show that we can enter Ordinal" do
#      assert_select "table tr th", "GamePlayer #"
#    end
#
#    should "show a dropdown to associate the GamePlayer with a Match" do
#      assert_select "table tr th", "Match"
#      assert_select "table tr td select[id='game_match_id']"
#    end
#  end
#
#  context "When creating a GamePlayer" do
#    should "be able to create a GamePlayer" do
#      assert_difference('GamePlayer.count') do
#        post :create, :game => @game.attributes
#      end
#      assert_redirected_to game_path(assigns(:game))
#    end
#  end

  # -------------------------------------------------------------------
  # Edit
  # -------------------------------------------------------------------
#  context "When editing the GamePlayer for a Game" do
#    setup do
#      get :edit, :game_id => @game.to_param
#    end
#
#    should "display the edit form" do
#      assert_response :success
#    end
#
#    should "use the edit template" do
#      assert_template :edit
#    end

#    should "redirect to the show view after a successful edit" do
#      put :update, :id => @game.to_param, :game => @game.attributes
#      assert_redirected_to game_path(assigns(:game))
#    end
#  end

  # -------------------------------------------------------------------
  # Destroy
  # -------------------------------------------------------------------
#  context "When removing a GamePlayer" do
#    should "be able to destroy a GamePlayer" do
#      assert_difference('GamePlayer.count', -1) do
#        delete :destroy, :id => @game.to_param
#      end
#    end
#
#    should "be redirected back to the display of all GamePlayers" do
#      delete :destroy, :id => @game.to_param
#      assert_redirected_to games_path
#    end
#  end

end
