require 'test_helper'

class GamePlayerTest < ActiveSupport::TestCase

  setup do
    @game = Factory(:game)
  end

  should belong_to      :game
  should belong_to      :player

end
