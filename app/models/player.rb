class Player < ActiveRecord::Base

  has_many :game_players, :dependent => :restrict
  has_many :games, :through => :game_players

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

end
