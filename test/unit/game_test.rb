require 'test_helper'

class GameTest < ActiveSupport::TestCase

  setup do
    @game = Factory(:game)
  end

  should have_db_column :ordinal
  should belong_to      :match

  should "have a name method which is the concatenation of 'Game #' and the ordinal" do
    assert_respond_to Game.new, :name
    assert_equal "Game ##{@game.ordinal}", @game.name
  end
  
end
