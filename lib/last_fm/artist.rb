class LastFM::Artist < LastFM
  def search query,page=1,limit=10
    qs = "method=artist.search&artist=#{query}&page=#{page}&limit=#{limit}"
    resp = do_request url+qs
    resp['results']['artistmatches']['artist'] rescue []
  end
end