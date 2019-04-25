class SeasonsController < InheritedResources::Base
  actions :create, :destroy, :edit, :index, :new, :show, :update
  before_action :authenticate_user!

  def create
    params.permit!
    super
  end

  def new_match
    @season = Season.find(params[:id])
    @match = @season.matches.build
  end

  def update
    params.permit!
    super
  end

end
