class Game < ActiveRecord::Base

  belongs_to :match
  
  has_many :game_players, :dependent => :restrict
  has_many :players, :through => :game_players

  def name
    return "Game ##{ordinal}"
  end

end
