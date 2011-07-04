class Match < ActiveRecord::Base
  belongs_to :season
  has_many :games

  def to_s
    "Match on #{self.match_date}"
  end

end
