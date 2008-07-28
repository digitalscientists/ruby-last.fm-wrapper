class LastFM::Track < LastFM
  def search query,page=1,limit=10
    qs = "method=track.search&track=#{query}&page=#{page}&limit=#{limit}"
    resp = do_request url+qs
    resp['results']['trackmatches']['track'] rescue []
  end
end