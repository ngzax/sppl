class Game < ActiveRecord::Base

  belongs_to :match

  has_many :results, -> { order "place"}, dependent: :destroy
  has_many :players, -> { order "place"}, through: :results

  accepts_nested_attributes_for :results, :allow_destroy => true

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
    "#{ordinal}"
  end

end
