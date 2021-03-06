require 'test_helper'

class SeasonsControllerTest < ActionController::TestCase

  setup do
    @season = create(:season)
    @match = create(:match)
    @season.matches << @match
    sign_in_as_admin
  end

  context "When showing ALL the Seasons in HTML" do
    setup do
      get :index
    end

    should "use the index template" do
      assert_response :success
      assert_template :index
    end

    should "have a seasons collection representing all the Seasons" do
      assert_not_nil assigns(:seasons)
    end

    should "provide a link to add a new Season" do
      assert_select "a", :content => "Add a New Season", :attributes => {:href => new_season_path}
    end

    should "Use Name, Start Year, and Stop Year as Headers" do
      assert_select "table tr th", "Name"
      assert_select "table tr th", "Start Year"
      assert_select "table tr th", "Stop Year"
    end

    should "Properly display the Season's Name, Start Year, and Stop Year" do
      assert_select "table tr td", "#{@season}"
      assert_select "table tr td", "#{@season.start_year}"
      assert_select "table tr td", "#{@season.stop_year}"
    end
  end


  context "When showing a single Season" do
    setup do
      get :show, :id => @season.to_param
    end

    should "use the show template" do
      assert_response :success
      assert_template :show
    end

    should "display a list of links to all associated matches" do
      assert_select "td a", "#{@match}"
    end

    should "display an Actions Section with a link to add a New Match" do
      assert_select "table tr th", "Actions:"
      assert_select "table tr td a", "Add a Match"
    end
  end


  context "When showing the form to create a New Season" do
    setup do
      get :new
    end

    should "be displayed using the new template" do
      assert_response :success
    end

    should "Correctly display the Header" do
      assert_select "h2", "Creating a Season"
    end

    should "Show that we can enter Ordinal, Start Year, and Stop Year" do
      assert_select "label", "Ordinal:"
      assert_select "input[id='season_ordinal']"
      assert_select "label", "Start year:"
      assert_select "input[id='season_start_year']", attributes: {type: 'text'}
      assert_select "label", "Stop year:"
      assert_select "input[id='season_stop_year']", attributes: {type: 'text'}
    end
  end

  context "When creating a Season" do
    should "be able to create a Season" do
      assert_difference('Season.count') do
        post :create, season: {ordinal: 2}
      end
      assert_redirected_to season_path(assigns(:season))
    end
  end

  context "When editing a Season" do
    setup do
      get :edit, :id => @season.to_param
    end

    should "display the edit form" do
      assert_response :success
    end

    should "use the edit template" do
      assert_template :edit
    end

    should "redirect to the show view after a successful edit" do
      put :update, :id => @season.to_param, :season => @season.attributes
      assert_redirected_to season_path(assigns(:season))
    end
  end

  context "When removing a Season" do
    should "be able to destroy a Season" do
      assert_difference('Season.count', -1) do
        delete :destroy, :id => @season.to_param
      end
    end

    should "be redirected back to the display of all Seasons" do
      delete :destroy, :id => @season.to_param
      assert_redirected_to seasons_path
    end
  end

end
