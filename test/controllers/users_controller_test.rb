require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  context "When signed in as Admin" do
    setup do
      sign_in_as_admin
      @user = User.first
    end

    should "Be able to see all Users" do
      get :index
      assert_response :success
      assert_not_nil assigns(:users)
    end

    should "should NOT have a new page" do
      assert_raises ActionController::UrlGenerationError do
        get :new
      end
    end

    should "NOT be able to directly Create a User" do
      assert_raises ActionController::UrlGenerationError do
        post :create, :user => {:username => "Tester", :password => "testy", :password_confirmation => "testy"}
      end
    end

    # should "be able to Create a User" do
    #   assert_difference('User.count') do
    #     post :create, :user => {:username => "Tester", :password => "testy", :password_confirmation => "testy"}
    #   end
    #
    #   assert_redirected_to user_path(assigns(:user))
    # end

    should "show user" do
      get :show, :id => @user.id
      assert_response :success
    end

    # should "should NOT have an an edit page" do
    #   get :edit, :id => @user.to_param
    #   assert_response :missing
    # end

    should "update user" do
      put :update, id: @user.to_param, user: {role: 'user'}
      assert_redirected_to user_path(assigns(:user))
    end

    should "NOT be able to directly Destroy a User" do
      assert_raises ActionController::UrlGenerationError do
        delete :destroy, :id => @user.to_param
      end
    end

  #   should "be able to destroy a user" do
  #     assert_difference('User.count', -1) do
  #       delete :destroy, :id => @user.to_param
  #     end
  #
  #     assert_redirected_to users_path
  #   end
  end

  context "When signed in as a Player" do
    setup do
      sign_in_as_player
      request.env["HTTP_REFERER"] = "/"
    end

    should "NOT be able to see all Users" do
      get :index
      assert_response :redirect
      assert_nil assigns(:users)
    end
  end

end
