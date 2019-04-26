require 'test_helper'

describe Game do

  before do
    @game = create(:game)
    @game.match = create(:match)
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
    p = create(:player)
    @game.players << p
    assert_equal 1, @game.players.count
  end

  should "display itself as #(ordinal) by default" do
    assert_equal "#{@game.ordinal}", "#{@game}"
  end

  context "when sorting Games" do
    should "sort Games with differing Match Dates by ascending Match Date" do
      @g2 = create(:another_game)
      @g2.match = create(:another_match)
      assert @game < @g2
    end

    should "sort Games with the same Match Date by ascending Ordinal" do
      @g2 = create(:another_game)
      @g2.match = create(:another_match)
      @g2.ordinal = 2
      assert @game < @g2
    end
  end

end
