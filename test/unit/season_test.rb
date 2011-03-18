require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  test "seasons have a name" do
    @s = Season.new
    assert @s
    @s.name = "test season"
    assert_equal "test season", @s.name
  end
end
