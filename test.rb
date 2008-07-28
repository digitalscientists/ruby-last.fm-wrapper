require 'lib/last_fm'
lfm = LastFM.new()
res = lfm.artist.search(:artist=>'cher')
p res

