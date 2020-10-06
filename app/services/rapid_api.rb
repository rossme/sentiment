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
        request["x-rapidapi-key"] = 'a5d18ad3eemshcdad0aeb6bdd35fp112bbdjsn47ff90eb1494'
        request["content-type"] = 'application/x-www-form-urlencoded'
        request.body = "text=Holidays!"

        response = http.request(request)
        result = JSON.parse(response.read_body)
        results = result["ratio"]
        if results == 1
            puts "You are happy!"
            puts results
        else
            puts "Why so sad?"
            puts results
        end
    end
end

SentimentApi.parsing