require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  setup do
    @player = Factory(:player)
  end

  should have_db_column :first_name
  should have_db_column :last_name
  should have_db_column :email
  should have_db_column :phone

  should "have a full name method which is the concatenated first and last names" do
    assert_respond_to Player.new, :full_name
    assert_equal "#{@player.first_name} #{@player.last_name}", @player.full_name
  end
  
end
