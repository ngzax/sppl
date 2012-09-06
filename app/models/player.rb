class Player < ActiveRecord::Base

  has_many :results, :dependent => :restrict
  has_many :games, :through => :results, :order => "place"

  def <=>(another_player)
    self.total_points <=> another_player.total_points
  end

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  def non_scoring_results
    self.results - self.scoring_results
  end

  def scoring_results
    ary = self.results.sort {|x, y| y.points <=> x.points}
    ary[0..5]
  end

  def season_games(season_id)
    self.games.select { |game| game.match.season_id = season_id}
  end

  def to_s
    full_name
  end

  def total_points
    return 0 if self.results.nil? 
    p = self.scoring_results.inject(0) {|sum, each| sum + each.points}
    p.round(2)
  end

end
