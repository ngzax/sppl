require 'test_helper'

class SeasonTest < ActiveSupport::TestCase

  should have_db_column :ordinal
  should have_db_column :start_year
  should have_db_column :stop_year
  
end
