require 'lib/last_fm'
lfm = LastFM.new()
res = lfm.artist.getInfo(:artist=>'cher')
p res
