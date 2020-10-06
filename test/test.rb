require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://twinword-sentiment-analysis.p.rapidapi.com/analyze/")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["x-rapidapi-host"] = 'twinword-sentiment-analysis.p.rapidapi.com'
request["x-rapidapi-key"] = 'a5d18ad3eemshcdad0aeb6bdd35fp112bbdjsn47ff90eb1494'
request["content-type"] = 'application/x-www-form-urlencoded'
request.body = "text=Hello World! What a fabulous day!"

response = http.request(request)
puts response.read_body["type"]
