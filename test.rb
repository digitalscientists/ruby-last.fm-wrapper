require 'lib/last_fm'

lfm = LastFM.new()
res = lfm.user.getlovedtracks(:user=>'christwoism')
p res

