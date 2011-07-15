require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  
  setup do
    @player = Factory(:player)
  end
  
  context "When showing ALL the Players in HTML" do
    setup do
      get :index
    end
  
    should "use the index template" do
      assert_response :success
      assert_template :index
    end

    should "have a Players collection representing all the Players" do
      assert_not_nil assigns(:players)
    end

    should "provide a link to add a new Player" do
      assert_tag :tag => "a", :content => "Add a New Player", :attributes => {:href => new_player_path}
    end

    should "Correctly display the Header" do
      assert_select "h1", "Showing All Players"
    end

    should "Use Player # as a Header" do
      assert_select "table tr th", "Player #"
    end

    should "Properly display the Player's Id" do
      assert_select "table tr td", "#{@player.id}"
    end
    
  end

  # -------------------------------------------------------------------
  # Show
  # -------------------------------------------------------------------
  context "When showing a single Player" do
    setup do
      get :show, :id => @player.to_param
      assert_response :success
    end

    should "use the show template" do
      assert_template :show
    end
    
    should "Correctly display the Header" do
      assert_select "h3", "Showing a Player"
    end

#    should "display a link back to the associated Match" do
#      assert_select "a", @player.full_name
#    end

  end

  # -------------------------------------------------------------------
  # New
  # -------------------------------------------------------------------
  context "When showing the form to create a New Player" do
    setup do
      get :new
    end

    should "be displayed using the new template" do
      assert_response :success
    end
    
    should "Correctly display the Header" do
      assert_select "h1", "Creating a New Player"
    end

    should "Display the Player's Id" do
      assert_select "table tr th", "Player #"
    end

    should "Show that we can enter the First Name" do
      assert_select "table tr th", "First name"
    end

  end

  context "When creating a Player" do
    should "be able to create a Player" do
      assert_difference('Player.count') do
        post :create, :player => @player.attributes
      end
      assert_redirected_to player_path(assigns(:player))
    end
  end

  context "When editing a Player" do
    setup do
      get :edit, :id => @player.to_param
    end

    should "display the edit form" do
      assert_response :success
    end

    should "use the edit template" do
      assert_template :edit
    end

    should "redirect to the show view after a successful edit" do
      put :update, :id => @player.to_param, :player => @player.attributes
      assert_redirected_to player_path(assigns(:player))
    end
  end

  context "When removing a Player" do
    should "be able to destroy a Player" do
      assert_difference('Player.count', -1) do
        delete :destroy, :id => @player.to_param
      end
    end

    should "be redirected back to the display of all Players" do
      delete :destroy, :id => @player.to_param
      assert_redirected_to players_path
    end
  end

end
