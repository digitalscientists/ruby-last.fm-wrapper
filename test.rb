require 'last_fm'
lfm = LastFM::Track.new('lfm.yml')
res = lfm.search('believe')
res.each do |t| 
  p t['name']
end