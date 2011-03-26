require 'test_helper'

class SeasonsControllerTest < ActionController::TestCase
  
  #setup do
    #@season = seasons(:one)
  #end
  
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
      assert_tag :tag => "a", :content => "Add a New Season", :attributes => {:href => new_season_path}
    end
    
  end


  #test "should get new" do
    #get :new
    #assert_response :success
  #end
#
  #test "should create season" do
    #assert_difference('Season.count') do
      #post :create, :season => @season.attributes
    #end
#
    #assert_redirected_to season_path(assigns(:season))
  #end
#
  #test "should show season" do
    #get :show, :id => @season.to_param
    #assert_response :success
  #end
#
  #test "should get edit" do
    #get :edit, :id => @season.to_param
    #assert_response :success
  #end
#
  #test "should update season" do
    #put :update, :id => @season.to_param, :season => @season.attributes
    #assert_redirected_to season_path(assigns(:season))
  #end
#
  #test "should destroy season" do
    #assert_difference('Season.count', -1) do
      #delete :destroy, :id => @season.to_param
    #end
#
    #assert_redirected_to seasons_path
  #end

end
