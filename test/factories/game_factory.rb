FactoryGirl.define do
  factory :game do |game|
    game.ordinal 1
  end
end

FactoryGirl.define do
  factory :another_game, :parent => :game do |game|
    game.ordinal 1
  end
end
