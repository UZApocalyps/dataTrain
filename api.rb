require 'uri'
require 'net/http'
class Api
    def self.get(url,parameters)
        uri = URI(url)
        params = parameters
        uri.query = URI.encode_www_form(params)
        res = Net::HTTP.get_response(uri)
        return res
    end
end
