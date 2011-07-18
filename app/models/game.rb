class Game < ActiveRecord::Base

  belongs_to :match
  
  has_many :game_players, :dependent => :restrict
  has_many :players, :through => :game_players

  def <(another_game)
    if self.match.match_date == another_game.match.match_date 
      return self.ordinal < another_game.ordinal
    end
    self.match.match_date < another_game.match.match_date
  end

  def <=>(another_game)
    if self.match.match_date == another_game.match.match_date 
      return self.ordinal <=> another_game.ordinal
    end
    self.match.match_date <=> another_game.match.match_date
  end

  def name
    return "Game ##{ordinal}"
  end

  def to_s
    "#{name} [#{match}]"
  end

end
