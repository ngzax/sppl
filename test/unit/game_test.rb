require 'test_helper'

class GameTest < ActiveSupport::TestCase

  setup do
    @game = Factory(:game)
  end

  should have_db_column :ordinal
  should have_many      :players
  should belong_to      :match

  should "have a name method which is the concatenation of 'Game #' and the ordinal" do
    assert_respond_to Game.new, :name
    assert_equal "Game ##{@game.ordinal}", @game.name
  end
  
  should "initially have no Players" do
    assert_equal 0, @game.players.count
  end
  
  should "be able to assign a Player to a Game" do
    p = Factory(:player)
    @game.players << p
    assert_equal 1, @game.players.count
  end
  
end
