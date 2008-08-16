module LastFM::Meta
  # This method handles and return most API
  # call in their default format. Override 
  # as needed within each class
  def method_missing(method,args = {:page=>1,:limit=>20})
    get lfm_query(method,args)
  end
end
