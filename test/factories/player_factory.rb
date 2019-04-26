FactoryGirl.define do
  factory :player do |player|
    player.first_name "Gus"
    player.last_name  "Van Zant"
    sequence(:email)  {|n| "player#{n}@sppl.com"}
    player.phone      "5555555555"
  end
end

FactoryGirl.define do
  factory :player_2, :parent => :player do |player|
    player.first_name "Dan"
    player.last_name  "Harrington"
    sequence(:email)  {|n| "player#{n}@sppl.com"}
    player.phone      "6666666666"
  end
end
