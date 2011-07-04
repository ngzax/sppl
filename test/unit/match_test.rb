require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  should belong_to :season  

  should have_db_column :match_date
  should have_db_column :created_at
  should have_db_column :updated_at

  should have_many :games

  should "display itself as 'Match on {match_date}' by default" do
    @m = Factory(:match)
    assert_equal "Match on #{@m.match_date}", "#{@m}"
  end

end
