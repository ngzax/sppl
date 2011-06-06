require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  setup do
    @player = Factory(:player)
  end

  should have_db_column :first_name
  should have_db_column :last_name
  should have_db_column :email
  should have_db_column :phone

  should have_many :games

  should "have a full name method which is the concatenated first and last names" do
    assert_respond_to Player.new, :full_name
    assert_equal "#{@player.first_name} #{@player.last_name}", @player.full_name
  end

  should "initially have no Games" do
    assert_equal 0, @player.games.count
  end
  
  should "be able to assign a Game to a Player" do
    g = Factory(:game)
    @player.games << g
    assert_equal 1, @player.games.count
  end
  
end
