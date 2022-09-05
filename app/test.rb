require 'httpclient'
require 'json'

client = HTTPClient.new()
response = client.get('http://api:8888')
data = JSON.parse(response.body)
p data['point'].to_i
