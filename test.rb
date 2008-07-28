require 'lib/last_fm'
lfm = LastFM.new()
res = lfm.artist.events(:artist=>'cher')
p res
