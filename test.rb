require 'lib/last_fm'

lfm = LastFM.new()
res = lfm.track.search(:track=>'redline')
p res

