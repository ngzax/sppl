require 'test_helper'

class GamePlayerTest < ActiveSupport::TestCase

  setup do
    @game = Factory(:game)

    @gus = Factory(:player)
    @dan = Factory(:player_2)
  end

  should belong_to      :game
  should belong_to      :player

  should "initially sort Players in a Game based upon their order of addition" do
    @game.players << @gus
    @game.players << @dan
    @game.save
    assert_equal @gus, @game.players.first
  end

  context "when altering the sort order" do
    setup do
      @gp1 = GamePlayer.create :game => @game, :player => @dan, :place => 1 
      @gp2 = GamePlayer.create :game => @game, :player => @gus, :place => 2 
    end

    should "be able to change the Place by direct editing" do
      assert_equal @dan, @game.players.first
      
      @gp1.place = 2
      @gp1.save

      @gp2.place = 1
      @gp2.save

      assert_equal @gus.id, @game.players.first.id
    end

    should "be able to alter the sort order by using the acts_as_list methods" do
      assert_equal @dan, @game.players.first

      @game.game_players.first.move_to_bottom    
      assert_equal @gus.id, @game.players.first.id

      @game.game_players.last.move_higher
      assert_equal @dan.id, @game.players.first.id
    end
  end

end
