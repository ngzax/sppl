Factory.define :season do |season|
  season.sequence(:ordinal) {|n| n }
  season.start_year 2010
  season.stop_year 2011
end
