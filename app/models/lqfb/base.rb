class LQFB::Base
  
  API_KEY = ENV['LQFB_API_KEY']
  API_DOMAIN = ENV['LQFB_API_DOMAIN']
  API_PATH = (ENV['LQFB_API_PATH'] || "").gsub(/\/$/,'') # todo: workaround for tests, needs to be solved
  
  
  protected
    
    def self.xml_hash res
      Hash.from_xml res.body
    end
    
    def self.get params
      new_http.get("#{API_PATH}/#{resource_name}.html?#{url_params(params)}")
    end
    
    def self.url_params params
      {key: API_KEY}.
        merge(params).
        collect{ |k,v| "#{k}=#{v.to_s}" }.
        join('&')
    end
    
    def self.new_http
      url = ::URI.parse("https://#{API_DOMAIN}")
      http = ::Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # todo: is that necessary ?
      http
    end
    
    def self.resource_name
      self.name.split('::').last.downcase
    end
  
end