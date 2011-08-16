class GamePlayer < ActiveRecord::Base

  acts_as_list :scope => :game, :column => "place"

  belongs_to :game
  belongs_to :player

end
