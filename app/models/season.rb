class Season < ActiveRecord::Base
  has_many :matches

  def name
    return "Season ##{ordinal}"
  end

end
