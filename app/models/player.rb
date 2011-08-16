class Player < ActiveRecord::Base

  has_many :game_players, :dependent => :restrict, :order => "place"
  has_many :games, :through => :game_players

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  def to_s
    full_name
  end

end
