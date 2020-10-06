require 'uri'
require 'net/http'
require 'openssl'
require 'json'


class SentimentApi

    def self.parsing
        url = URI("https://twinword-twinword-bundle-v1.p.rapidapi.com/sentiment_analyze/")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Post.new(url)
        request["x-rapidapi-host"] = 'twinword-twinword-bundle-v1.p.rapidapi.com'
        # THIS KEY SHOULD BE IN .ENV
        request["x-rapidapi-key"] = 'a5d18ad3eemshcdad0aeb6bdd35fp112bbdjsn47ff90eb1494'
        request["content-type"] = 'application/x-www-form-urlencoded'
        request.body = "text=What a nice day!"

        response = http.request(request)
        result = JSON.parse(response.read_body)
        return result
    end
end

words = SentimentApi.parsing
puts words