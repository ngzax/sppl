FactoryGirl.define do
  factory :match do |match|
    match.match_date "1/1/2011"
  end
end

FactoryGirl.define do
  factory :another_match, :parent => :match do |match|
    match.match_date "2/1/2011"
  end
end
