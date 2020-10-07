require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class TwinwordApi

    def self.parsing
        # *SECURITY ISSUE* KEY HERE UNTIL .ENV WORKS CORRECTLY
        safe_code = 'a5d18ad3eemshcdad'
        url = URI("https://twinword-twinword-bundle-v1.p.rapidapi.com/sentiment_analyze/")
        puts "How do you feel?"
        user_input = gets.chomp


        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Post.new(url)
        request["x-rapidapi-host"] = 'twinword-twinword-bundle-v1.p.rapidapi.com'
        # SECURITY ISSUE* KEY HERE UNTIL .ENV WORKS CORRECTLY
        request["x-rapidapi-key"] = "#{safe_code}0aeb6bdd35fp112bbdjsn47ff90eb1494"
        request["content-type"] = 'application/x-www-form-urlencoded'
        request.body = "text=#{user_input}"

        response = http.request(request)
        result = JSON.parse(response.read_body)
        return result
    end

    def self.response
        results = TwinwordApi.parsing

        response = []
        results.each do |result|
            response << result[1]
        end
        puts "Then you are feeling #{response[0]}."
    end
end

puts TwinwordApi.response