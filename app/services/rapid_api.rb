require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'byebug'

class RapidApiService
    def self.parsing

        url = URI("https://twinword-sentiment-analysis.p.rapidapi.com/analyze/")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Post.new(url)
        request["x-rapidapi-host"] = 'twinword-sentiment-analysis.p.rapidapi.com'
        request["x-rapidapi-key"] = ENV['RAPID_API_KEY']
        request["content-type"] = 'application/x-www-form-urlencoded'
        request.body = "text=Hello World! What a fabulous day!"

        response = http.request(request)
        result = JSON.parse(response.read_body)


        return result
        
    end
    byebug
end
