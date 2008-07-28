# lfm = LastFM::Track.new
# res = lfm.search('believe')
# res.each do |t| 
#   p t['name']
# end
require 'rubygems'
require 'net/http'
require 'activesupport'
class LastFM
  attr_reader :url
  def initialize cnf_path
    cnf = YAML.load_file cnf_path
    @url = "http://ws.audioscrobbler.com/2.0/?api_key=#{cnf['LAST_FM_KEY']}&"
  end
  def do_request uri
    begin
      url  = URI.parse(uri)
      req  = Net::HTTP::Get.new(url.path+"?"+url.query)
      @response = Net::HTTP.start(url.host, url.port) {|http| http.request(req) }
      result = XmlSimple.xml_in(@response.body, 'keeproot' => false, 'forcearray' => false)
    rescue
     puts "Request failed for #{uri}"
    end
  end
end

class LastFM::Artist < LastFM
  def search query,page=1,limit=10
    qs = "method=artist.search&artist=#{query}&page=#{page}&limit=#{limit}"
    resp = do_request url+qs
    resp['results']['artistmatches']['artist'] rescue []
  end
end
class LastFM::Track < LastFM
  def search query,page=1,limit=10
    qs = "method=track.search&track=#{query}&page=#{page}&limit=#{limit}"
    resp = do_request url+qs
    resp['results']['trackmatches']['track'] rescue []
  end
end