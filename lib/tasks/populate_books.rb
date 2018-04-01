require 'net/http'
require 'json'
 
url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
uri = URI(url)
response = Net::HTTP.get(uri)
JSON.parse(response)
