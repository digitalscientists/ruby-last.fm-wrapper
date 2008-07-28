class LastFM::Group < LastFM
  def method_missing(method,args = {:page=>1,:limit=>20})
    do_request lfm_query(method,args)
  end
end