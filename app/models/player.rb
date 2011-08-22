class Player < ActiveRecord::Base

  has_many :results, :dependent => :restrict, :order => "place"
  has_many :games, :through => :results, :order => "place"

  def <=>(another_player)
    self.total_points <=> another_player.total_points
  end

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  def to_s
    full_name
  end

  def total_points
    p = self.results.inject(0) {|sum, each| sum + each.points}
    p.round(2)
  end

end
