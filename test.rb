require 'lib/last_fm'
lfm = LastFM.new()
res = lfm.track.search('redline')
res.each do |t| 
  p t['name']
end