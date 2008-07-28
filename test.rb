require 'lib/last_fm'
lfm = LastFM.new()
res = lfm.artist.search(:artist=>'radiohead')
p res

