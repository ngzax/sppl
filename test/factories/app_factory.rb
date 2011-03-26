Factory.define :season do |season|
  season.sequence(:name) {|n| "Season #{n}" }
end
