class LastFM
  include LastFM::Meta  
  attr_reader :url
  def initialize 
    @@cnf  = YAML.load_file 'lfm.yml'
    @@url = "http://ws.audioscrobbler.com/2.0/?api_key=#{@@cnf['LAST_FM_KEY']}&"
  end
  def get uri
    begin
      url       = URI.parse(uri)
      req       = Net::HTTP::Get.new(url.path+"?"+url.query)
      @response = Net::HTTP.start(url.host, url.port) {|http| http.request(req) }
      result    = XmlSimple.xml_in(@response.body, 'keeproot' => false, 'forcearray' => false)
    rescue
     puts "Request failed for #{uri}"
    end
  end
  
  def lfm_query method,params
    klass = self.class.to_s.gsub("LastFM::","").downcase
    "#{@@url}method=#{klass}.#{method}&#{params.to_query}"    
  end
  
  def album() @track            ||= Album.new() end
  def artist() @artist          ||= Artist.new() end
  def event() @event            ||= Event.new() end
  def geo() @geo                ||= Geo.new() end
  def group() @group            ||= Group.new() end
  def library() @library        ||= Library.new() end
  def playlist() @playlist      ||= Playlist.new() end
  def tag() @tag                ||= Tag.new() end
  def tastometer() @tastometer  ||= Tastometer.new() end
  def track() @track            ||= Track.new() end
  def user() @user              ||= User.new() end
  
end