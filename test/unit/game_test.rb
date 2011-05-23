require 'test_helper'

class GameTest < ActiveSupport::TestCase

  should have_db_column :ordinal
  should belong_to      :match

#  should "have a name method" do
#    assert_respond_to Game.new, :name
#  end
  
end
