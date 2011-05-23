class Game < ActiveRecord::Base

  belongs_to :match

  def name
    return "Game ##{ordinal}"
  end

end
