require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  should have_db_column :match_date
  should belong_to :season  
end
