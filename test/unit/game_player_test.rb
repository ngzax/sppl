require 'test_helper'

class GamePlayerTest < ActiveSupport::TestCase

  setup do
    @game = Factory(:game)
  end

  should belong_to      :game
  should belong_to      :player

#  should "have a name method which is the concatenation of 'GamePlayer #' and the ordinal" do
#    assert_respond_to GamePlayer.new, :name
#    assert_equal "GamePlayer ##{@game.ordinal}", @game.name
#  end
#  
#  should "initially have no Players" do
#    assert_equal 0, @game.players.count
#  end
#  
#  should "be able to assign a Player to a GamePlayer" do
#    p = Factory(:player)
#    @game.players << p
#    assert_equal 1, @game.players.count
#  end
#  
#  should "display itself as GamePlayer #(ordinal) [Match] by default" do
#    assert_equal "GamePlayer ##{@game.ordinal} [#{@game.match}]", "#{@game}"
#  end

end
