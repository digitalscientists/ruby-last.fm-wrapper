# lfm = LastFM::Track.new
# res = lfm.search('believe')
# res.each do |t| 
#   p t['name']
# end

class LastFM
  attr_reader :url
  def initialize 
    cnf = YAML.load_file'lfm.yml'
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
  
  def track() @track ||= Track.new() end
  def artist() @artist ||= Artist.new() end
  
end