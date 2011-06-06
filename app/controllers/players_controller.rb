class PlayersController < InheritedResources::Base
  actions :create, :destroy, :edit, :index, :new, :show, :update
  
  def index
    index! { @page_title = "All Players" }
  end

  def show
    show! { @page_title = "Showing a Player" }
  end

end
