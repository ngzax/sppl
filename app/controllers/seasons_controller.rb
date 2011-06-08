class SeasonsController < InheritedResources::Base
  actions :create, :destroy, :edit, :index, :new, :show, :update

  def new_match
    @season = Season.find(params[:id])
    @match = @season.matches.build
  end

end
